#!/bin/bash

USERID=$(id-u)
#echo "User ID is $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"

#Functions
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "Please run this script with root privileges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N"
        exit 1
    else
        echo -e "$2 is $G success $N"
    fi
}

CHECK_ROOT   

dnf list installed git
#VALIDATE $? "Listing Git" where $1 is $? and $2 is Listing Git

if [ $? -ne 0 ]
then
    echo "Git is not installed. Going to install it.."
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed. Nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed. Going to install it.."
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed. Nothing to do.."
fi

