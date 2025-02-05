#!/bin/bash

number=$1

if [ $number -gt 10 ] # -gt, -lt, -eq,-ne,-ge, -le
then 
    echo "Given number $number is greater than 10"
else
    echo "Given number $number is less than or equal to 10"
fi