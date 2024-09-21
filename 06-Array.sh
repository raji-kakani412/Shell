#!/bin/bash

Fruits=("Apple" "Kiwi" "Orange") #Array

echo "First fruit is : ${Fruits[0]}"
echo "Second fruit is : ${Fruits[1]}"
echo "Third fruit is : ${Fruits[2]}"


echo "list of all fruits : ${Fruits[@]}" # @ will return all the fruits