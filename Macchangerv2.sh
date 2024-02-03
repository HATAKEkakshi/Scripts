#!/bin/bash

echo "How many times you want mac address to be changed"
read n
echo "Enter device name"
read device
ifconfig $device down
while [ $i <= $n ]
do
    macchanger -e $device
    i++
done
ifconfig $device up
