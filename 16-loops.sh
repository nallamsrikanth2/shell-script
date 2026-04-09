#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOF_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE (){
    if [ $? -ne 0 ]
    then 
        echo -e "$2 is $R failure $N"
        exit 1
    else
        echo -e "$2 is $G success $N"
    fi
}

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
    dnf list installed $i  &>>$LOF_FILE
    if [ $? -eq 0 ]
    then
        echo -e "alreay installed .... $Y SKIPING $N"
    else
        dnf install $i -y &>>$LOF_FILE
        VALIDATE $? "installing $i"
    fi
done

