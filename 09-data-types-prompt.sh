#!/bin/bash

echo "Enter the first number"
read number1
echo "Enter the second number"
read number2

sum=$(($number1+$number2))

echo "Total sum of $number1 and $number2 is $sum"