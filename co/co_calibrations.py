import csv
import json
import pandas as pd
import os
from datetime import datetime
from pytz import timezone
import matplotlib.pyplot as plt
import datetime
import urllib
import numpy as np

##### Ref data prep

values_df = pd.read_csv("CO_Lookup_2023_03_13.csv")

#global variables
B0 = 0.0355374 
A1 = 0.0019875 
A2  = 2.5575529 
A3 = -0.0542801 

locations_df = pd.read_csv("breathe_providence_sensors.csv")

#merge with the other grace data to get the node ids and locations
ref_df = pd.merge(values_df, locations_df, on='Location')

#drop unecessary columns, note curr droping lat and log
ref_df = ref_df.drop(['Height in stories (approx)','Height in meters (approx)', 'Installation Date','Latitude','Longitude','Name'], axis=1)

print(ref_df)

print(ref_df.head())
print(ref_df.columns)

#convert to csv 
ref_df.to_csv("ref_df.csv")


### Fetch the data from the server
def get_requests(node_name, node_id, variable, start_date, start_time, end_date, end_time):
    """Given a node_id, measure, start date and end date return the raw cvs files for that node """

    base_url = "http://128.32.208.8"


    custom_url = ("/node/" + str(node_id)
                  + "/measurements_all/csv?name=" + str(node_name) + "&interval=60&variables=" + variable + "&start=" +
                  str(start_date) + "%20" + str(start_time) + "&end=" + str(end_date) + "%20" + str(end_time) + "&char_type=measurement")
    
    return base_url + custom_url



def get_requests_for_row(row, start_date, end_date, variable, start_time, end_time):
    """Helper for get_data. Gets requets for a given row, for a pre-defined start-date, end-date, pollution variant and time """


    url = get_requests(urllib.parse.quote(row["Location"]), row["Node ID"], variable, start_date, start_time, end_date, end_time)
    try:
        data = pd.read_csv(url)
    except:
        data = pd.DataFrame()
        print(f"An error occurred while trying to fetch data from the server for node " + str(row["Node ID"]) + " at " + row["Location"])
        print("This is the url: " + url)
    return data


def get_data(data, start_date, end_date, variable, start_time, end_time):
    """Loads all the measurements from the nodes and store them into a pandas dataframe. To modify specifics go to get_requests for row"""
    all_data = data.apply(get_requests_for_row, axis=1, args=(start_date, end_date, variable, start_time,end_time))
    combined = pd.concat(all_data.values)
    #how can i get all of the values for 'co2_corrected_avg_t_drift_applied' and print them as list
    return combined


#Helper Functions 
def est_to_pst(time):
  """Takes in time represented as a datetime and returns, in the same format, the time converted into pst. Assumes the time is est. Returns a str,"""

  print(time,type)
  # Convert the string to a datetime object

  # Convert to Pacific Timezone
  date = time.astimezone(timezone('US/Pacific'))

  # Format the date as a string and return
  return date


def pst_to_est(time):
  """Takes in time represented as a string and returns, in the same format, the time converted into est. Assumes the time is pst. Returns a str,"""

  #convert it to a time date module 
  date = datetime.datetime.strptime(time,"%Y-%m-%d %H:%M:%S")

  date = date.astimezone(timezone('US/Pacific'))
  return date

def clean_data(data):
  """Cleans the panda dataframe removing missing data, drops unecessary columns and tranforms data from pst to est"""


  print(data)
  #drop unecessary columns
  data = data.drop(columns=['epoch', 'local_timestamp',"node_file_id",'Ref Dates',])

  #remove missing data, -999
  data = data.replace({'co_wrk_aux': {-999.00000: np.NaN}})
  data = data.dropna(subset=['datetime', 'co_wrk_aux'])

  #change time zones 
  data['datetime'] = data['datetime'].map(lambda x: pst_to_est(x))

  return data

#calling the function on the necessary values
curr_time = est_to_pst(datetime.datetime.now())

end_date = str(curr_time)[0:10]
end_time = str(curr_time)[11:19] 

rounded_time = curr_time.replace(minute=0, second=0, microsecond=0)
start_date = "2022-9-1"
start_time = "00:00:00"
end_date = str(curr_time)[0:10]
end_time = str(curr_time)[11:19] 
variable = "co_wrk_aux,temp"

#getting the data
# data_df = get_data(ref_df, start_date, end_date, variable, start_time, end_time)

# #rename node_id to Node ID
# data_df = data_df.rename(columns={"node_id": "Node ID"})

# #merge the data with the reference to get lookup values
# main_df = pd.merge(data_df, ref_df, on='Node ID')
# main_df = clean_data(main_df)
# print(main_df)
# print(main_df.columns)


### For every sensor generate:  co_wrk_aux_ref(SensorXX) = $intercept$ + $slope*co_wrk_aux(SensorXX) 
def generate_reference(df):
    df["co_wrk_aux_ref"] = None
    df["co_wrk_aux_ref"] = df.apply(lambda row: row["Intercept"] + row["Slope"]*row["co_wrk_aux"], axis=1)

    #get the mean of co_wrk_aux_ref for every sensor, store it in co_wrk_aux_ref_mean
    df["co_wrk_aux_ref_mean"] = df.groupby("Node ID")["co_wrk_aux_ref"].transform("mean")
    return df

# main_df = generate_reference(main_df)
# print(main_df)
       
def apply_filters(df):
    df = df[df["temp"] < 30]
    df = df[df["co_wrk_aux_ref"] < 10*df["co_wrk_aux_ref_mean"]]
    return df

# main_df = apply_filters(main_df)
# print(main_df)

def generate_correction(df):
    #what is sensorXX_BME?
    df["CO_ppb"] = None
    df["CO_ppb"] = df.apply(lambda row: B0 + A1*row["temp"] + A2*row["co_wrk_aux_ref"] + A3*row["co_wrk_aux_ref"]*row["temp"], axis=1)
    return df

# main_df = generate_correction(main_df)
# print(main_df)

#save the data to a csv file
# main_df.to_csv("corrected_co.csv")


# plot time and calibrated co
# plt.plot(main_df["datetime"], main_df["CO_ppb"])



### Apply filters
## Temp(SensorXX) < 30 deg-C 
##co_wrk_aux_ref(SensorXX) < 10*co_wrk_aux_ref_mean(SensorXX) 


##CO_ppb(SensorXX) = B0 + A1*temp(SensorXX_BME) + A2*co_wrk_ref + A3*co_wrk_ref(SensorXX)*temp(SensorXX_BME) 