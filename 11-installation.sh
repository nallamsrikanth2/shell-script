#!/bin/bash

USERID=(id -u)

if [$USERID -ne 0]
then
    echo "please run with code in super user"
    exit 1
else
    echo "you are a super user"
fi


dnf install mysqll -y

if [$? -ne 0]
then
    echo "my mysql is..failure"
    exit 1
else
    echo "mysql is sucess"
fi


dnf install git -y

echo "This is basic shell-scripting"
