#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you are not super user and please run the script in root user"
    exit 1
else 
    echo "you are super user"
fi


dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "mysql is the failure"
    exit 1
else 
    echo "mysql is success"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "git is failure"
    exit 1
else
    echo "git is success"
fi

echo "my this basic shell script"



