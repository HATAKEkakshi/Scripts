#!/bin/bash
figlet "MOnitor Mode" -c 
echo "For Monitor mode press 1"
read no

monit(){
            echo "Enter Device Name"
            read n
            ifconfig $n down
            iwconfig $n mode monitor
            ifconfig $n up
            iwconfig

}

if [ $no -eq 1 ];
then    
    echo "Switiching to monitor mode"
    monit
else
    echo "Wrong Input"
fi