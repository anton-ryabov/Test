#!/usr/bin/env bash

declare -i test=1
while (($test<=5))
do
  for host in 192.168.0.1 173.194.222.113 87.250.250.242; do
    nc -zw1 $host 80
    echo $? $host `date` >> test.log
  done
test+=1
sleep 1
done