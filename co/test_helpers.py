import datetime
from pytz import timezone


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


############### Test Cases #####################

# Test Case 1
# Currently in PST Input: 2019-01-01 00:00:00
# EST Output: 2019-01-01 03:00:00

print(pst_to_est("2019-01-01 00:00:00"))

# Test Case 2
# Currently in PST Input: 2019-01-01 12:00:00
# EST Output: 2019-01-01 15:00:00
print(pst_to_est("2019-01-01 12:00:00"))

# Test Case 3
# Currently in PST Input: 2019-01-01 23:59:59
# EST Output: 2019-01-02 02:59:59
print(pst_to_est("2019-01-01 23:59:59"))
