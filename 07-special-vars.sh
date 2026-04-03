#!/bin/bash

echo "All variables: $@"
echo "Number of variable passed: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "home directory of current user: $HOME"
echo "which user is running this script: $USER"
echo "HOSTNAME: $HOSTNAME"
echo "Process id of current shell script: $$"
sleep 60 &
echo "process ID of last background: $!"
