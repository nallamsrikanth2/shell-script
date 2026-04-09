#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOF_FILES=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

echo "script staeted excuting at $TIMESTAMP"

VALIDATE () {
if [$? -ne 0]
then 
    echo "$1 is failure"
else 
    echo "$2 is success"
fi
}

if [$USERID -ne 0]
then
    echo "please run the script in root user"
    exit 1
else
    echo "you are root user"
fi

dnf install git -y &>>$LOF_FILES
VALIDATE $? "installing git"

dnf install nginx -y &>>$LOF_FILES
VALIDATE $? "installing nginx"