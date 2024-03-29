#!/bin/bash

echo "How many times you want mac address to be changed"
read n
echo "Enter device name"
read device
i=1
ifconfig $device down
while [ $i -lt $n ]
do
    macchanger -e $device
    i=$i+1
done
ifconfig $device up
