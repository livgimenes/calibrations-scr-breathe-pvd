
import pandas as pd
from datetime import datetime
from pytz import timezone
import matplotlib.pyplot as plt
import datetime
import urllib
import numpy as np
import plotly.graph_objects as go



############# Custom vizualization funcitons for CO #############


def make_scatter_plot(data,title):

    x_min = data['temp'].quantile(0.05) # exclude 5% of lowest values
    x_max = data['temp'].quantile(0.95) # exclude 5% of highest values

    #get the largest value of CO
    y_max = data['co_wrk_aux'].max()
    y_min = data['co_wrk_aux'].min()

    # create a scatter plot with adjusted color and size
    plt.scatter(data['temp'], data['co_wrk_aux'], color='cornflowerblue', s=25,edgecolor='black', alpha=0.5)
    plt.xlim(x_min, x_max)
    plt.ylim(y_min, y_max) # set y-axis range

    # add labels and title
    plt.xlabel('Temperature')
    plt.ylabel('CO (ppb)')
    plt.title(title + ': Temperature vs CO')

    # display the plot
    plt.show()


def make_timeseries_general(dataframe,name):
    dataframe['timestamp'] = pd.to_datetime(dataframe['timestamp'])

    plt.plot(dataframe["timestamp"],dataframe["CO_ppb"])
    plt.xlabel('Time')
    plt.ylabel('CO Concentration')
    plt.ylim(0, 5)

    plt.title(name + ' :Time versus CO Concentration')
    plt.show()


import matplotlib.dates as mdates

def make_timeseries_specific(dataframe,name):
    dataframe['timestamp'] = pd.to_datetime(dataframe['timestamp'])

    fig, ax = plt.subplots()
    ax.plot(dataframe['timestamp'],dataframe['CO_ppb'])
    ax.xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m'))
    fig.autofmt_xdate()

    ax.set_xlabel('Time')
    ax.set_ylabel('CO Concentration')

    ax.set_title(name + ' :Time versus CO Concentration')
    plt.show()











