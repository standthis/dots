#!/bin/bash

i3status | while :
do
    read line
    mac=`ip addr | grep ether | awk -F ' ' '{print $2}'`
    echo "$mac | $line" || exit 1
done
