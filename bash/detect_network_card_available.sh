#!/bin/bash

url=$1
if [[ -z url ]]
then
    url="baidu.com"
fi

interfaces=$(ifconfig | grep mtu | awk -F ':' '{print $1}')

for interface in ${interfaces[@]}
do
  ping -I $interface -W 1 -c1 $url &> /dev/null
  if [[ "$?" == 0 ]]
  then
    echo "$interface is ok"
  else
    echo "$interface is disavailable"
  fi
done

