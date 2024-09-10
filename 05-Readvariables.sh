#!/bin/bash

echo "Please enter your username::"
read -s USERNAME # takes input into USERNAME variable and -s will not display name in terminal for eg password we use it/sensitive 
echo "Username entered is: $USERNAME"

echo "Please enter your Password"
read -s PASSWORD
echo "PASSWORD entered is: $PASSWORD" #this one is not used generally because it will display password in terminal

