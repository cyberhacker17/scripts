#!/bin/bash
#Version 1.3
#this scripts can open ports in a host
host=172.16.1
for ip in $(seq 1 1024);
do
knock -d 500 -v $host.$ip 13 37 30000 3000 40000 3456 1467;
done
