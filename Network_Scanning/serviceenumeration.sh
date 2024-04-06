#!/bin/bash
figlet "Service Enumerator" -c
target_ip(){
     echo "Enter traget ip"
     read targetip
}
ftp(){
    target_ip
    nmap -sV -p21 -sC -A $targetip -Pn
}
SSH(){
   target_ip
    n=1
    while [ $n -eq 1 ];
    do
        echo "<----------------SELECT FROM THE FOLLOWING OPTIONS TO CONTIUE--------------------->"
        echo "1.Algorithms"
        echo "2.Weak Keys"
        echo "3.Autnentication"
        echo "<------------------------------------------------------------------------------->"
        read sshopt
        if [ $sshopt -eq 1 ];
        then
            nmap -p22 $targetip --script ssh2-enum-algos
        elif [ $sshopt -eq 2 ];
        then
            nmap -p22 $targetip --script ssh-hostkey --script-args ssh_hostkey=full
        elif [ $sshopt -eq 3 ];
        then
            nmap -p22 $targetip --script ssh-auth-methods --script-args="ssh.user=root"
        fi
        echo "Do you want to go back to menu"
        echo "1.Press 1 to back to the menu"
        echo "2.Press any key to abort"
        read sshoption
        if [ $sshoption -eq 1 ];
        then
            n=1
        elif [ $sshoption -eq 2 ];
        then
            n=2
        fi
    done
}
telnet(){
    target_ip
    nmap -n -sV -Pn --script "*telnet* and safe" -p 23 $targetip
}
POP(){
    target_ip
    echo "Enter target port"
    read Port
    nmap --script "pop3-capabilities or pop3-ntlm-info" -sV -p $Port $targetip
}
serviceenum(){
    M=1
    while [ $M -eq 1 ];
    do
        echo "<---------------------------SERVICE ENUMERATION------------------------->"
        echo "1.Ftp"
        echo "2.SSH"
        echo "3.Telnet"
        echo "4.POP"
        echo "<----------------------------------------------------------------------->"
        read opt
        if [ $opt -eq 1 ];
        then
            ftp
        elif [ $opt -eq 2 ];
        then
            SSH
        elif [ $opt -eq 3 ];
        then
            telnet
        elif [ $opt -eq 4 ];
        then
            POP
        fi
        echo "Do you want to return back to main menu or exit press 1 for continue and any key to abort"
        read option
        if [ $option -eq 1 ];
        then
            M=1
        elif [ $option -eq 2 ];
        then
            M=2
        fi
    done
}
serviceenum