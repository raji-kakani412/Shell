#!/bin/bash


set -e # this will find out error automatically and exists
FAILURE()
{
    echo "Failed at $1: $2"
}

trap 'FAILURE "${LINENO}" "${BASH_COMMAND}"' ERR # ERR is the error signal

echo "Hello world success"
echooooo "Hello world success"
echo "Hello world success"