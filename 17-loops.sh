#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo 0$ | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE (){
    if [ $? -ne 0 ]
    then
        echo "$2 is failure"
        exit 1
    else
        echo "$2 is success"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "Please run inside the root user"
    exit 1
else
    echo "You are a root user"
fi

for i in "@"
do
    echo "installed packages are : $i"
    dnf list installated $i &>>$LOG_FILE
    if [ $? -eq 0 ]
    then    
        echo "already installed skipping"
    else
        dnf install $i -y &>>$LOG_FILE
        VALIDATE $? "installating $i"
    fi
done