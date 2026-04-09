#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOF_FILES=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "script started excuting at $TIMESTAMP"

VALIDATE() {
if [ $? -ne 0  ]
then 
    echo -e "$2 is $R failure $N"
else 
    echo -e "$2 is $G success $N"
fi
}

if [ $USERID -ne 0 ]
then
    echo "please run the script in root user"
    exit 1
else
    echo -e " $G you are root user $N"
fi

dnf install git -y &>>$LOF_FILES
VALIDATE $? "installing git"

dnf install nginx -y &>>$LOF_FILES
VALIDATE $? "installing nginx"