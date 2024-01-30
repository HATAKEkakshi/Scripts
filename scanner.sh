#!/bin/bash

echo "Enter your traget ip"
read ip

echo "Enter your port"
read port

echo "Select a Scan "
echo "1.Aggersive"  
echo "2.For Syn"  
echo "3.TCP Scan"
read st

if [ $st -eq 1 ];
then
    nmap -A $ip -p $port |grep open
elif [ $st -eq 2 ];
then
    nmap -sS -O -sV $ip -p $port |grep open
elif [ $st -eq 3 ];
then
    nmap -sT -O -sV $ip -p $port |grep open
fi