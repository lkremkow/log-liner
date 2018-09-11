#! /bin/bash

LOGDIRPATH="."
if [[ -s "setting-log-directory-path.dat" ]]
then
  LOGDIRPATH=`cat setting-log-directory-path.dat`
else
  echo "$LOGDIRPATH" > setting-log-directory-path.dat
fi

LOGOUTPUTFILE="$LOGDIRPATH"/"qualys_was_detections.log"

TMPDATAFILE="qualys_was_detections.tmp"

echo converting XML of scan results into log file

for web_app_scan_result_to_process in ./completed_web_app_scan_*.xml; do
  if [[ -s $web_app_scan_result_to_process ]]
  then
    echo converting XML of scan result "$web_app_scan_result_to_process" to log lines
    echo
    xsltproc --nonet --novalid --output "$TMPDATAFILE" web_app_scan_results_line_by_line.xslt $web_app_scan_result_to_process

    if [[ -f "$TMPDATAFILE" ]]
    then
      cat "$TMPDATAFILE" >> "$LOGOUTPUTFILE"
      rm "$TMPDATAFILE"
    fi

    rm "$web_app_scan_result_to_process"
  fi
done

echo done converting XML of scan results into log file
