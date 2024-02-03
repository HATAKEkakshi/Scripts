#!/bin/bash

echo "How many times you want mac address to be changed"
read n
echo "Enter device name"
read device
ifconfig $device down
for i in $n 
do
    macchanger -e $device
done
ifconfig $device up
