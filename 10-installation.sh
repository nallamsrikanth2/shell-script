#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you are not super user and please run the script in root user"
    exit 1
else 
    echo "you are super user"
fi


dnf install mysqll -y


echo "my this basic shell script"



