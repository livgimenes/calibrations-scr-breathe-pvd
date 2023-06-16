
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
    plt.title(title + ': Temperature vs.s CO')

    # display the plot
    plt.show()












