#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE (){
if [ $? -ne 0 ]
then
    echo "$2 ....failue"
    exit 1
else
    echo "$2  .....success"
fi
}

if [ $USERID -ne 0 ]
then
    echo "please run the script inside the root user"
    exit 1
else    
    echo "you are root user"
fi

dnf install mysql -y   &>>$LOG_FILE
VALIDATE $? "installing mysql"

dnf install git -y  &>>$LOG_FILE
VALIDATE $? "installing git"