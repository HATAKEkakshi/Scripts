figlet "Chidori" -c
wifi(){
    figlet "Wifi Attacks" -c
    echo "Choose from the Following tool"
    echo "1.Shake"
    echo "2.Deauther"
    read cho
    if [ $cho -eq 1 ];
    then
        direct
        $path/Wifi_attacks/flood.sh
    elif [ $cho -eq 2 ];
    then
        direct
        $path/Wifi_attacks/airplay.sh
    fi
}
direct(){
    path=/home/hatakekakashi/developer/Scripts
}
n=1
while [ $n -eq 1 ];
do
    echo "<-------------------------SELECT FROM THE FOLLOWING TOOL------------------>"
    echo "1. Updater"
    echo "2. Vpn"
    echo "3. Scan"
    echo "4. Service Enumerator"
    echo "5. Cracked"
    echo "6. LinuxCheat"
    echo "7. Osnit"
    echo "8. Wifi Attacks"
    echo "9. Help"
    echo "10. Exit"
    echo "<------------------------------------------------------------------------->"
    read choice
    if [ $choice -eq 1 ];
    then
        direct
        $path/Basic/update.sh
    elif [ $choice -eq 2 ];
    then
        direct
        $path/Basic/vpn.sh
    elif [ $choice -eq 3 ];
    then
        direct
        $path/Network_Scanning/scanv2.sh
    elif [ $choice -eq 4 ];
    then
        direct
        $path/Network_Scanning/serviceenumeration.sh
    elif [ $choice -eq 5 ];
    then
        direct
        $path/Password_Cracking/passwordcracker.sh
    elif [ $choice -eq 6 ];
    then
        direct
        $path/Linuxcheat/linuxcheat.sh
    elif [ $choice -eq 7 ];
    then
        direct
        $path/Osnit/meta.sh
    elif [ $choice -eq 8 ];
    then
        wifi
    elif [ $choice -eq 9 ];
    then
        echo "This is user guide for Chidori"
        echo "1. Updater is for Updating the System "
        echo "2. Vpn is for using OpenVPn directly the file name of vpn without the extension ovpn"
        echo "3. Scan is tool for network scanning"
        echo "4. Service Enumeration is for advancing scanning in protocals"
        echo "5. Cracked is for password cracking"
        echo "6. Linuxcheat is for linux basic commands like copy the file and moving the file and deleting the folder or file making exceutable the file as new user dont the command"
        echo "6. Osnit is for osint tools like grabbing phone number details and scanning the photo"
        echo "7. Wifi attacks is for as the name suggests for wifi attacks"
    elif [ $choice -eq 10 ];
    then
        n=2
    fi
done