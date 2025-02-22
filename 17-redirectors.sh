#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) # where $0 gives us script name 17-redirectors.sh
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER # Creates a folder shell-script and -p indicates if folder is not there it creates otherwise it wont show any error

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


#Functions
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo -e "$R Please run this script with root privileges $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is $G success $N"  | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:$N sudo sh 17-redirectors.sh pkg1 pkg2 pkg3 .. "
    exit 1
}

echo "script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT 

if [ $# -eq 0 ]
then 
    USAGE
fi

# sudo sh 16-install-loop.sh git mysql postfix nginx
for package in $@ # $@ refers to all args passed to it
do
    dnf list installed $package  &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed. Going to install it.." | tee -a $LOG_FILE
        dnf install $package -y  &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed. Nothing to do.. $N" | tee -a $LOG_FILE
    fi
done