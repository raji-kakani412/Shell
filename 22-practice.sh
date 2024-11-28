#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0]
    then
        echo -e "$R Please run with root previliges $N "
        exit 1
    fi
}

VALIDATE(){
   if [$1 -ne 0]
   then
        echo -e "$2 is $R FAILURE $N"
    else 
        echo -e "$2 is $R SUCCESS $N "
    fi
    
}

CHECK_ROOT

dnf list installed git

if [ $? -ne 0]
then
    echo "git is not installed.going to install it.."
    dnf install git -y
    VALIDATE $? "Installing git "
else    
    echo "git is already installed.. Nothing to do"
fi
