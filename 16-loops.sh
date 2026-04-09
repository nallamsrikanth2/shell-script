#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOF_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

if [ $USERID -ne 0 ]
then 
    echo "please run the script inside the root server"
    exit 1
else
    echo "you are in root user"
fi

for i in "$@"
do
    echo "packages to install $i"
    dnf list installed $i  &>>$SCRIPT_NAME
    if [ $? -eq 0 ]
    then
        echo "alreay installed ....SKIPING"
        exit
    else
        echo "need to install"
    fi
done

