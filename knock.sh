#!/bin/bash
host=172.16.1
for ip in $(seq 1 1024);
do
knock -d 500 -v $host.$ip 13 37 30000 3000;
done
