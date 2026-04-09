#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE (){
if [ $? -ne 0 ]
then
    echo -e "$2 $R is failue $N"
    exit 1
else
    echo -e "$2  $G is success $N"
fi
}

if [ $USERID -ne 0 ]
then
    echo -e "$R please run the script inside the root user $N"
    exit 1
else    
    echo -e " $G you are root user $N"
fi

dnf install mysql -y   &>> $LOG_FILE
VALIDATE $? "installing mysql"

dnf install git -y  &>> $LOG_FILE
VALIDATE $? "installing git"

dnf install jenkins -y &>> $LOG_FILE
VALIDATE $? "installing jenkins"