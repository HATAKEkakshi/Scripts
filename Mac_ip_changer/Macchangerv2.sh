#!/bin/bash

echo "How many times you want mac address to be changed"
read n
echo "Enter device name"
read device
i=1
ifconfig $device down
for ((i=0; i < $n ;i++));
do
    macchanger -e $device
done
ifconfig $device up
