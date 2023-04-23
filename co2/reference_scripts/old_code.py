def generate_reference_data(data):
  """"Generates the average of the median of all nodes to refernece for calculations"""
  #TODO: check if hour would need to be encorporated 
  nodes_median = []
  for node_id in NODE_NUM_LIST:
    node_subset = data[data["node_id"] == node_id]
    #average here
    node_subset_median = mean(node_subset["co2_corrected_avg"])
    nodes_median.append(node_subset_median)
  #median here
  reference_average = mean(nodes_median)
  return reference_average
