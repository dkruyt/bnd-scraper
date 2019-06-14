# bnd-scraper

A shell script that get your stock info from Brand New Day and puts it into InfluxDB

# DISCLAMER

I created this script for personal usage. Use at own risk. I am not RESPONSABLE for any loss of your credentials or loss of funds.

# Install

* Add user Brand New Day credentials in the file bnd-scraper.sh. 
* Add the InfluxDB settings in bnd-scraper.sh and if needed and create in InfluxDB the database.
* Add the bnd-scraper.sh script in a cron job every hour or day.
* Import the example Grafana dashboard grafana.json

# Grafana screenshot

![grafana](https://raw.githubusercontent.com/dkruyt/resources/master/bnd-scraper-grafana.png)


