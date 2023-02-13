#!/usr/bin/env bash

  declare -i test=1
  while (($test==1))
  do
    #for host in 192.168.0.1 173.194.222.113 87.250.250.242;
    for host in 192.168.56.3
     do
      nc -zw1 $host 80
      if (($?!=0))
      then
        echo $? $host `date` >> error.log
        exit 0
      else
        echo $? $host `date` >> test.log
      fi
    done
  sleep 1
  done