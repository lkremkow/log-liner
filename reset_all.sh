#! /bin/bash

for file_to_delete in ./*.log ./*.dat ./*.tmp ./*.xml; do
  if [[ -f "$file_to_delete" ]]
  then
    echo removing "$file_to_delete"
    rm "$file_to_delete"
  fi
done
