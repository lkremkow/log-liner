#! /bin/bash

LOGDIRPATH="."
if [[ -s "setting-log-directory-path.dat" ]]
then
  LOGDIRPATH=`cat setting-log-directory-path.dat`
else
  echo "$LOGDIRPATH" > setting-log-directory-path.dat
fi

LOGOUTPUTFILE="$LOGDIRPATH"/"qualys_tickets.log"

# where fetch_open_tickets_xml.sh stored the raw data from the Qualys API
QUALYSAPIOUTPUT="tickets.xml"

TMPDATAFILE="tickets.tmp"

# if there is a temporary conversion output file from a previous run, remove it
if [[ -f $TMPDATAFILE ]]
then
  rm $TMPDATAFILE
fi

# run only if we have host detection data
if [[ -f $QUALYSAPIOUTPUT ]]
then
  echo
  echo converting XML of tickets to log lines
  echo
  xsltproc --nonet --novalid --output $TMPDATAFILE tickets_line_by_line.xslt $QUALYSAPIOUTPUT
fi

# run only if a new temporary detection data file was created by xsltproc above
if [[ -f $TMPDATAFILE ]]
then
  cat $TMPDATAFILE >> $LOGOUTPUTFILE
  rm $TMPDATAFILE
  rm $QUALYSAPIOUTPUT
fi
