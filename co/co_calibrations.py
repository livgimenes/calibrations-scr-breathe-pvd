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



##### Preparing reference data

#Global Variables
B0 = 0.0355374 
A1 = 0.0019875 
A2  = 2.5575529 
A3 = -0.0542801 

# Reference Table
ref_df = pd.read_csv("lookup_tables/co_lookup_with_sensors.csv",usecols=["Sensor","Node ID","Location","Name","Intercept","Slope","R2"])
ref_df = ref_df.dropna(subset=['Node ID'])
ref_df["Node ID"] = ref_df["Node ID"].apply(lambda x: str(x)[0:3])


print(ref_df)


###### Getting the data from the BEACON Serves

def get_requests(node_name, node_id, variable, start_date, start_time, end_date, end_time):
    """Given a node_id, measure, start date and end date return the raw cvs files for that node """

    base_url = "http://128.32.208.8"


    custom_url = ("/node/" + str(node_id)
                  + "/measurements_all/csv?name=" + str(node_name) + "&interval=60&variables=" + variable + "&start=" +
                  str(start_date) + "%20" + str(start_time) + "&end=" + str(end_date) + "%20" + str(end_time) + "&char_type=measurement")
    
    return base_url + custom_url



def get_requests_for_row(row, start_date, end_date, variable, start_time, end_time):
    """Helper for get_data. Gets requets for a given row, for a pre-defined start-date, end-date, pollution variant and time """


    url = get_requests(row["Name"], row["Node ID"], variable, start_date, start_time, end_date, end_time)
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
    return combined


#Helper Functions 
def est_to_pst(time):
  """Takes in time represented as a datetime and returns, in the same format, the time converted into pst. Assumes the time is est. Returns a str,"""

  # Convert to Pacific Timezone
  date = time.astimezone(timezone('US/Pacific'))

  # Format the date as a string and return
  return date


def pst_to_est(pst_time_str):
  # Create a timezone object for PST
  pst_timezone = timezone('US/Pacific')
    
  # Convert the input time string to a datetime object in PST
  pst_time = datetime.datetime.strptime(pst_time_str, '%Y-%m-%d %H:%M:%S')
  pst_time = pst_timezone.localize(pst_time)
    
  # Convert the PST datetime to EST
  est_timezone = timezone('US/Eastern')
  est_time = pst_time.astimezone(est_timezone)
    
  # Format the EST datetime as a string
  est_time_str = est_time.strftime('%Y-%m-%d %H:%M:%S')
    
  return est_time_str


def clean_data(data):
  """Cleans the panda dataframe removing missing data, drops unecessary columns and tranforms data from pst to est. Note use local_timestamp for pst, it renames the column to timstamp and datetime will return UTC time"""

  #drop unecessary columns
  data = data.drop(columns=['epoch',"node_file_id","datetime"])

  #change the name to match 
  data = data.rename(columns={"node_id": "Node ID"})

  #Currently drops rows with missing data
  data = data.replace({'co_wrk_aux': {-999: np.NaN}})

  # filter out negative values
  data = data[data['co_wrk_aux'] >= 0]
  data = data.dropna(subset=['local_timestamp', 'co_wrk_aux',"temp"])

  #turn the Node ID into a string
  data["Node ID"] = data["Node ID"].astype(str)

  # change time zones, name
  data['timestamp'] = data['local_timestamp'].map(lambda x: pst_to_est(x))
  data = data.drop(columns=['local_timestamp'])



  return data

def generate_reference(df):

    #This generates the co_wrk_aux_ref column
    df["co_wrk_aux_ref"] = None
    df["co_wrk_aux_ref"] = df.apply(lambda row: row["Intercept"] + row["Slope"]*row["co_wrk_aux"], axis=1)

    
    #This generates the co_wrk_aux_ref_mean column for the next step
    node_list = list(df["Node ID"].unique())
    for node in node_list:
       # filter the dataframe to only include reading from that node 
        node_df = df[df["Node ID"] == node]


       # get the mean of co_wrk_aux_ref for that node
        mean = node_df["co_wrk_aux_ref"].mean()
        if node == 250:
            print(mean)

    
       # for all of the rows in the dataframe that have that node, set that df["co_wrk_aux_ref_mean"] as that mean value
        df.loc[df["Node ID"] == node, "co_wrk_aux_ref_mean"] = mean

    
    return df

       
def apply_filters(df):

    df = df[df["temp"] < 30]
    df = df[df["co_wrk_aux_ref"] < 10*df["co_wrk_aux_ref_mean"]]
    return df


def generate_correction(df):
    
    #CO_ppb(SensorXX) = B0 + A1*temp(SensorXX_BME) + A2*co_wrk_ref + A3*co_wrk_ref(SensorXX)*temp(SensorXX_BME) 
    df["CO_ppb"] = None
    df["CO_ppb"] = df.apply(lambda row: B0 + A1*row["temp"] + A2*row["co_wrk_aux_ref"] + A3*row["co_wrk_aux_ref"]*row["temp"], axis=1)
    return df


def generate_final_corrections():
    """Generates the final corrections for the data and saves it to a csv file"""

    #Getting the time ranges(September 1st 2022 to current time)
    curr_time = est_to_pst(datetime.datetime.now())
    curr_time = curr_time.replace(minute=0, second=0, microsecond=0)
    # end_date = str(curr_time)[0:10]
    # end_time = str(curr_time)[11:19] 


    #NOTE: Currently using March 1st 2023 as the end dates
    end_date = "2023-3-1"
    end_time = "00:00:00"


    start_date = "2022-9-1"
    start_time = "00:00:00"
    variable = "co_wrk_aux,temp"

    #Getting the uncalibrated data
    data_df = get_data(ref_df, start_date, end_date, variable, start_time, end_time)

    #Clean the data
    data_df = clean_data(data_df)
    
    #save as csv
    data_df.to_csv("uncorrected_co.csv")

    #merge the data with the reference to get lookup values
    main_df = pd.merge(ref_df, data_df, on='Node ID')

    # Step 1:  co_wrk_aux_ref(SensorXX) = $intercept$ + $slope*co_wrk_aux(SensorXX) 
    step_one_df = generate_reference(main_df)

    # Step 2:  Apply Filters: Temp(SensorXX) < 30 deg-C, co_wrk_aux_ref(SensorXX) < 10*co_wrk_aux_ref_mean(SensorXX) 
    step_two_df = apply_filters(step_one_df)

    # Step 3: CO_ppb(SensorXX) = B0 + A1*temp(SensorXX_BME) + A2*co_wrk_ref + A3*co_wrk_ref(SensorXX)*temp(SensorXX_BME) 
    step_three_df = generate_correction(step_two_df)

    #drop some columns
    step_three_df = step_three_df.drop(columns=['Slope', 'R2', 'Intercept'])

    #save as csv
    step_three_df.to_csv("corrected_co.csv")


    return step_three_df


generate_final_corrections()




