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
QUALYSAPIOUTPUT="tickets.xml"

if [[ -f $QUALYSAPIOUTPUT ]]
then
  rm $QUALYSAPIOUTPUT
fi

echo
echo contacting Qualys to get data of remediation tickets
echo
curl --silent --show-error -H "X-Requested-With: log-liner" -u "$FOUSER:$FOPASS" "https://$SOCURL/msp/ticket_list.php?states=OPEN,IGNORED,RESOLVED,CLOSED" -o $QUALYSAPIOUTPUT

echo done getting remediation ticket data
