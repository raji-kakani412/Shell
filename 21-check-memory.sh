#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 # real projects it is usually 75

while IFS= read -r line # IFS is Internal Field Seperator,empty means it will not ignore white spaces. -r is for not ignoring special characters like /
do
    #echo $line
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}'| cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs|awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD]
    then
        echo "$PARTITION is more than $DISK_THRESHOLD,current value is: $USAGE. Please Check"
    fi
done <<< $DISK_USAGE