#!/bin/bash

# Your BND details
USERNAME="username"
PASSWORD="password"

# Influx
INFLUXHOST="http://localhost:8086"
INFLUXDB="stock"

# Curl path
CURL="/usr/bin/curl"

# Get date
DATE=$(date +%s)

# Set cookie
COOKIE="/tmp/bnd.cookie"

# Log in and get Cookie
${CURL} -k -s -S --max-time 5 -c ${COOKIE} -b ${COOKIE} -d "username=${USERNAME}&password=${PASSWORD}&token=" https://secure.brandnewday.nl/mijn-gegevens/inloggen > /dev/null
# Get account values in json
${CURL} -k -s -S --max-time 5 -c ${COOKIE}  -b ${COOKIE}  https://secure.brandnewday.nl/mijn-overzicht/getinvestmentaccountsportfoliovalues | jq -r '.Message' | jq '.' > /tmp/bnd.$$

AccountID=( $(jq '.AccountList[].AccountID' /tmp/bnd.$$) )

for i in ${AccountID[@]}
do
	AccountDetail=( $( jq -r '.AccountList[] | select(.AccountID == '$i') | .AccountID,.ActionName,.ProductID,.Portfolio.Value' /tmp/bnd.$$) )

	${CURL} -i -XPOST "${INFLUXHOST}/write?precision=s&db=${INFLUXDB}" --data-binary "bnd,AccountID=${AccountDetail[0]},ActionName=${AccountDetail[1]},ProductID=${AccountDetail[2]} value=${AccountDetail[3]} ${DATE}"
done

rm ${COOKIE}
rm /tmp/bnd.$$
