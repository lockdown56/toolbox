#!/bin/bash

interfaces=$(ifconfig | grep mtu | awk -F ':' '{print $1}')

for interface in ${interfaces[@]}
do
  ping -I $interface -W 1 -c1 badu.com &> /dev/null
  if [[ "$?" == 0 ]]
  then
    echo "$interface is ok"
  else
    echo "$interface is disavailable"
  fi
done

