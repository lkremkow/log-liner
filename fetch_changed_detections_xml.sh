#! /bin/bash

FOUSER=""
if [[ -s "setting-username.dat" ]]
then
  FOUSER=`cat setting-username.dat`
else
  echo please put your Qualys username into the \"setting-username.dat\" file
  touch setting-username.dat
  exit 1
fi

FOPASS=""
if [[ -s "setting-password.dat" ]]
then
  FOPASS=`cat setting-password.dat`
else
  echo please put your Qualys password into the \"setting-password.dat\" file
  touch setting-password.dat
  exit 1
fi

SOCURL=""
if [[ -s "setting-soc-url.dat" ]]
then
  SOCURL=`cat setting-soc-url.dat`
else
  echo please put the URL of your Qualys SOC into the \"setting-password.dat\" file
  touch setting-soc-url.dat
  exit 1
fi

# where to store the raw data from the Qualys API
QUALYSAPIOUTPUT="detections_changed.xml"

# delete previous file if it exists
if [[ -f $QUALYSAPIOUTPUT ]]
then
  rm $QUALYSAPIOUTPUT
fi

# read or set timestamp of last time we checked the API
# so we only download each data point once
LASTCHECK=""
if [[ -f "last_checked_changed.dat" ]]
then
  LASTCHECK=`cat last_checked_changed.dat`
else
  LASTCHECK="2001-01-01T00:00:00Z"
fi

date -u +%Y-%m-%dT%H:%M:%SZ > last_checked_new.dat

echo
echo contacting Qualys to get detection data for changed vulnerabilities
echo
curl --silent --show-error -H "X-Requested-With: log-liner" -u "$FOUSER:$FOPASS" "https://$SOCURL/api/2.0/fo/asset/host/vm/detection/?action=list&show_results=0&show_reopened_info=0&output_format=XML&truncation_limit=1000&severities=1-5&status=New,Re-Opened,Fixed&detection_updated_since=$LASTCHECK" -o $QUALYSAPIOUTPUT

echo done getting detection data for changed vulnerabilities
