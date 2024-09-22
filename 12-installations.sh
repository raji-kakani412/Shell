#!/bin/bash

USERID=$(id -u )
echo "User ID is $USERID"

if [ $USERID -ne ]
then 
    echo "Please run this script with root privileges"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed. Going to install it.."
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git installation is not success. Check it.."
        exit 1
    else
        echo "Git installation is success"
    fi
else
    echo "Git is already installed. Nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed. Going to install it.."
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "MySQL installation is not success. Check it.."
        exit 1
    else
        echo "MySQL installation is success"
    fi
else
    echo "MySQL is already installed. Nothing to do.."
fi

