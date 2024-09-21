#!/bin/bash

echo "All variables passed to the script is: $@"
echo "Number of args passed: $#"
echo "script name: $0"
echo "Current working directory $PWD"
echo "Home directory of current user: $HOME"
echo "Process instance ID of current executing script $$"
sleep 100 &
echo "PID of last backgroung command : $!"