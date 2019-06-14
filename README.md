# bnd-scraper

A shell script that get your stock info from Brand New Day and puts it into InfluxDB

# DISCLAMER

I created this script for personal usage. Use at own risk. I am not RESPONSABLE for any loss of your credentials or loss of funds.

# Install

* Add user Brand New Day credentials in the file. 
* Add the InfluxDB settings if needed and create in InfluxDB the database.
* Add the script in a cron job every hour or day.
* Import the example Grafana dashboard.

# Grafana screenshot

![grafana](https://raw.githubusercontent.com/dkruyt/resources/master/bnd-scraper-grafana.png)


