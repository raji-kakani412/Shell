#!/bin/bash

#we can send variables through arguments also using sh <file name> arg1 arg2 .... arg1 is read by using $1 and second one by $2
PERSON1=$1
PERSON2=$2

echo "$PERSON1: Hi ${PERSON2}, How are you doing?"
echo "${PERSON2}:I am good. How are you?"
echo "$PERSON1: I am doing good. What's going on?"
echo "${PERSON2}: I am practicing Shell scripting"
