#!/bin/bash

SOURCE_DIR="/home/ec2-user/logs"
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ -d $SOURCE_DIR ] # -d is directory 
then    
    echo -e "$SOURCE_DIR $G exits $N"
else
    echo -e "$SOURCE_DIR $R doesn't exist $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name “*.log” -mtime +14)
echo "Files older than 14 days are: $FILES"

while IFS= read -r file # IFS is Internal Field Seperator,empty means it will not ignore white spaces. -r is for not ignoring special characters like /
do
    echo "deleting file:$file "
    rm -rf $file
done <<< $FILES