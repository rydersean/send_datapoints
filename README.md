# send_datapoints
Code to send Infrastructure Monitoring metric datapoints to Splunk Observability

* Send datapoint with metric and dimension values
* Add timestamp to datapoint
* Add timestamp in the past to simulate latency in datapoint
* Datapoint values randomly generated to identify each datapoint in timeseries database
* Can adjust the resolution of signal and number of datapoints to send

1) Copy the file to a Linux or Mac and enter your Splunk Observability Token

2) Make the script executable
$ chmod +x send_data.sh

3) Run the script
./send_data.sh

4) Log into Splunk Observability and chart the metric and dimension to see your data
