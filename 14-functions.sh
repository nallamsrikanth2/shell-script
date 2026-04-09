#!/bin/bash

USERID=$(id -u)

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
else    
    echo "you are root user"
fi

dnf install mysql -y
VALIDATE $? "installing mysql"

dnf install git -y
VALIDATE $? "installing git"