#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you are not super user and please run the script in root user"

else 
    echo "you are super user"
fi


dnf install mysql -y



