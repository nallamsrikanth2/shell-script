#!/bin/bash
NAME=("og" "kushi" "bangaram")
USERID=$(id -u)

echo "first movie is ${NAME[0]}"

echo "Second movie is ${NAME[1]}"

echo  "Third movie is ${NAME[2]}"

echo "Enter the your username"

read -s USERNAME

echo "Enter the your password"

read -s PASSWORD

echo "My username is $USERNAME AND Password is $PASSWORD"

echo "Welcome to my AWS server"

if [ $USERID -ne 0 ]
then
    echo "please run this script in root user"
    exit 1
else
    echo "you are a super user"
fi

dnf install nginx -y

if [ $? -ne 0 ]
then
    echo "nginx installation: .... failure"
    exit 1
else
    echo "nginx is sucuess"
fi

dnf install nodejs -y

if [ $? -ne 0 ]
then 
    echo "nodejs installation is failure"
    exit 1
else
    echo "nodejs installation is success"
fi







