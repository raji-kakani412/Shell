#!/bin/bash

USERID=$(id -u)
echo "User ID is $USERID"

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
        echo "$2 is failed"
        exit 1
    else
        echo "$2 is success"
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

