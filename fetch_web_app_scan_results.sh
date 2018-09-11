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

# file created by previous step, extract_web_app_scan_ids.sh
WEBAPPSCANIDLIST="completed_web_app_scan_ids.dat"

PREVIOUSWEBAPPSCANIDLIST="web_app_scan_ids_already_downloaded.dat"

WEBAPPSCANIDSTOFETCH="web_app_scan_ids_to_fetch.tmp"

touch "$PREVIOUSWEBAPPSCANIDLIST"

# filter out which scan ids are new
cat "$WEBAPPSCANIDLIST" "$PREVIOUSWEBAPPSCANIDLIST" | sort | uniq -u > "$WEBAPPSCANIDSTOFETCH"

cat "$WEBAPPSCANIDLIST" >> "$PREVIOUSWEBAPPSCANIDLIST"

# create a unique list of scan ids that have been retrieved
TMPFILE=./$RANDOM$RANDOM.tmp
cat "$PREVIOUSWEBAPPSCANIDLIST" | sort | uniq > "$TMPFILE"
cp "$TMPFILE" "$PREVIOUSWEBAPPSCANIDLIST"
rm "$TMPFILE"

# if there are new Web App Scan IDs go fetch them
if [[ -s "$WEBAPPSCANIDSTOFETCH" ]]
then
  WEBAPPSCANIDSTOFETCH=`cat "$WEBAPPSCANIDSTOFETCH"`
  for FETCHTHISID in $WEBAPPSCANIDSTOFETCH; do
    echo
    echo contacting Qualys to get web application scan results for ID $FETCHTHISID
    echo

    curl --silent --show-error -u "$FOUSER:$FOPASS" -H "X-Requested-With: log-liner" "https://$SOCURL/qps/rest/3.0/download/was/wasscan/$FETCHTHISID" -o completed_web_app_scan_$FETCHTHISID.xml

    echo got web application scan results for ID $FETCHTHISID
  done

fi

echo done getting web application scan results
echo

rm "$WEBAPPSCANIDSTOFETCH"
