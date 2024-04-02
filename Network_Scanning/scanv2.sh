#!/bin/bash

echo "Enter Traget ip"
read ip
n=1
while [ $n -eq 1 ];
do
    echo "Enter service you want to run"
    echo "1.Basic port scan"
    echo "2.Service Scan"
    echo "3.Version scan"
    echo "4.Scripts scan"
    echo "5.Nmap script scanner"
    echo "6.Exit"
    read scan
    if [ $scan -eq 1 ];
    then
        nmap $ip -Pn
    elif [ $scan -eq 2 ];
    then
        nmap -sC $ip -Pn
    elif [ $scan -eq 3 ];
    then
        nmap -sV $ip
    elif [ $scan -eq 4 ];
    then
        nmap -p- -sC -sV -Pn $ip 
    elif [ $scan -eq 5 ];
    then
        echo "Enter keyword for which script you want to search"
        read keyword
        ls -al /usr/share/nmap/scripts/ |grep $keyword
        echo "Attack from following scripts"
        echo "Please enter script name "
        read script
        nmap -p- -sC -Pn -sV --script $script $ip
    elif [ $scan -eq 6 ];
    then
        n=2
    fi 
done