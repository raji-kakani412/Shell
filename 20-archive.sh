#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if $3 is empty default is 14 days
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
R="\e[31m"
N="\e[0m"
USAGE(){
    echo -e "$R USAGE:$N sh 20-archive.sh <source> <destination> <days(optional)>"
}

#check the source and destination directory details are provided
if [ $# -lt 2]
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR]
then
    echo "$SOURCE_DIR doesnot exist. Please check"
fi

if [ ! -d $DEST_DIR]
then
    echo "$DEST_DIR doesnot exist. Please check"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
if [ ! -z $FILES] #-Z is empty means true if file is empty, ! makes it false
then
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip "$ZIP_FILE" -@
    # check if zip file is successfully created or not
    if [ -f $ZIP_FILE]
    then
        echo "Successfully zipped files older than $DAYS"
        # remove files from source directory
        while IFS= read -r file # IFS is Internal Field Seperator,empty means it will not ignore white spaces. -r is for not ignoring special characters like /
        do
            echo "Deleting file:$file "
            rm -rf $file
        done <<< $FILES
    else
        echo "Zippling files is failed"
    fi
else
    echo "No files are older than $DAYS"
fi