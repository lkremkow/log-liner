#! /bin/bash

# where fetch_web_app_scan_list.sh stored the raw data from the Qualys API
QUALYSAPIOUTPUT="completed_web_app_scans.xml"

WEBAPPSCANIDLIST="completed_web_app_scan_ids.dat"

# if there is a Web App Scan ID list file from a previous run, remove it
if [[ -f $WEBAPPSCANIDLIST ]]
then
  rm $WEBAPPSCANIDLIST
fi

# run only if we have host detection data
if [[ -f $QUALYSAPIOUTPUT ]]
then
  echo
  echo extracting Web App Scan IDs from complete Web App Scan XML list
  echo
  xsltproc --nonet --novalid --output $WEBAPPSCANIDLIST extract_web_app_scan_ids.xslt $QUALYSAPIOUTPUT
  rm "$QUALYSAPIOUTPUT"
fi
