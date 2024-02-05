#!/bin/bash

echo "Enter Traget ip"
read ip
echo "Enter service you want to run"
echo "1.Basic port scan"
echo "2.Service Scan"
echo "3.Version scan"
echo "4.scripts scan"
read scan
if [ $scan -eq 1 ];
then
    nmap $ip
elif [ $scan -eq 2 ];
then
    nmap -sC 
elif [ $scan -eq 3 ];
then
    nmap -sV
elif [$scan -eq 4 ];
then
    nmap -p- -sC -sV $ip 
fi