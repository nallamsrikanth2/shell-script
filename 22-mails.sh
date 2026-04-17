#!/bin/bash

DISK_USAGE=$(df -h | grep xfs)
THRESHOLD=10
MESSAGE=""


while IFS read -r line
do
USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
FOLDER=$( echo $line | awk -F " " '{print $NF}')
if [ $USAGE -ge $THRESHOLD]
then
    MESSAGE+="$FOLDER is more than $THRESHOLD, curren usage : $USAGE"
fi
done <<< $DISK_USAGE
