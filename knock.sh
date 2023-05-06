#!/bin/bash
#Version 1.5
#this scripts can open ports in a host
if [ "$1" == "" ]
then
echo "script - Knock"
echo "Mode of use: ./knock.sh IP or url"
else
host=$1
for ip in $(seq 1 1024);
do
knock -d 500 -v $host.$ip 13 37 30000 3000 40000 3456 1467;
done
fi
