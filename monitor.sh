#!/bin/bash

echo "For Monitor mode press 1"
read no

monit(){
            ifconfig wlan0 down
            iwconfig wlan0 mode monitor
            ifconfig wlan0 up
            iwconfig

}

if [ $no -eq 1 ];
then    
    echo "Switiching to monitor mode"
    monit
else
    echo "Wrong Input"
fi