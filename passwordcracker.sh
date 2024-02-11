#!/bin/bash
yourdirect(){
    direct=/home/hatakekakashi/
}
wordlist2(){
    passwordfile
    wordlist=wordlist_2
}
passwordfile(){
    yourdirect
    echo "Select from following password list"
    echo "Select you want to select from Seclist or no"
    echo "1.yes"
    echo "2.No for different custom list"
    read opt
    if [ $opt -eq 1 ];
    then
        echo "<----------------------------SELECT FROM THE FOLLOWING OPTION---------------------------------->"
        echo "1.Leaked Databases"
        echo "2.BiblePass"
        echo "3.Malaware"
        echo "4.Honeypot-caputres"
        echo "5.Wifi-Wpa"
        echo "6.Common-credentials"
        echo "7.Software"
        echo "8.Cracked Hashes"
        echo "9.Others password list"
        echo "10.Wikipedia"
        echo "<----------------------------------------------------------------------------------------------->"
        read cracked
        if [ $cracked -eq 1 ];
        then
            wordlist=$direct/SecLists/Passwords/Cracked-Hashes/milw0rm-dictionary.txt
        elif [ $cracked -eq 2 ];
        then
            echo "Select which set list you want"
            echo "1.Biblepass list 01-09"
            echo "2.Biblepass list 10-17"
            read close
            if [ $close -eq 1 ];
            then
                echo "Enter the number of list"
                read p
                for ((i=1;i<=p;i++))
                do
                    wordlist=$direct/SecLists/Passwords/BiblePass/BiblePass_part0$i.txt
                done
            else
                echo "Enter the number of list"
                read p
                for ((i=10;i<=p;i++))
                do
                    wordlist=$direct/SecLists/Passwords/BiblePass/BiblePass_part$i.txt
                done
            fi
        elif [ $cracked -eq 3 ];
        then
            echo "choose from the following"
            echo "1.Conficker"
            echo "2.mirai-botnet.txt"
            read q
            if [ $q -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/Malware/conficker.txt
            elif [ $q -eq 2] ;
            then
                wordlist=$direct/SecLists/Passwords/Malware/mirai-botnet.txt
            else
                echo "Oops choose wrong input"
            fi
        elif [ $cracked -eq 4 ];
        then
            echo "<--------------------------------------Choose from the following--------------------------------> "
            echo "1.Sucuri-Top-Wordpress-Passwords.txt"
            echo "2.multiplesources-passwords-fabian-fingerle.de.txt"
            echo "3.python-heralding-sep2019.txt"
            echo "4.wordpress-attacks-july2014.txt"
            echo "<------------------------------------------------------------------------------------------------->"
            read qw
            if [ $qw -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/Honeypot-Captures/Sucuri-Top-Wordpress-Passwords.txt
            elif [ $qw -eq 2 ];
            then
                wordlist=$direct/SecLists/Passwords/Honeypot-Captures/multiplesources-passwords-fabian-fingerle.de.txt
            elif [ $qw -eq 3 ];
            then
                wordlist=$direct/SecLists/Passwords/Honeypot-Captures/python-heralding-sep2019.txt
            elif [ $qw -eq 4 ];
            then
                wordlist=$direct/SecLists/Passwords/Honeypot-Captures/wordpress-attacks-july2014.txt
            fi
        fi
    else
        echo "Enter the destination of the file of wordlist"
        read open
        wordlist=$open
    fi
}
echo "<------------------------------------------------Select format of Password you want to crack------------------------------------------------->"
echo "1.Protocol type"
echo "2.Wifi password"
echo "3.File password/hashes"
echo "<---------------------------------------------------------------------------------------------------------------------------------------------->"
read type
if [ $type -eq 1 ];
then
    echo "under construnction"
    
elif [ $type -eq 2 ];
then
    
    aircrak(){
        echo "Enter name of handshake file"
        read handshake
        echo "Select the wordlist for password cracking"
        passwordfile
        aircrack-ng $handshake -w $wordlist
    }

    echo "Welcome to password cracker"
    echo "Press 1 to continue"
    read n
    if [ $n -eq 1 ];
    then
        aircrak
    else
        "wrong Input"
    fi
elif [ $type -eq 3 ];
then
    echo "Do you have hash of the file "
    echo "1.Yes"
    echo "2.NO"
    read hc
    if [ $hc -eq 1 ];
    then
        echo "<--------------------Below are Mentioned Hashes type---------------------->"
        echo "        900 | MD4
        0 | MD5
        100 | SHA1
        1300 | SHA2-224
        1400 | SHA2-256
        10800 | SHA2-384
        1700 | SHA2-512
        17300 | SHA3-224
        17400 | SHA3-256
        17500 | SHA3-384
        17600 | SHA3-512"
        echo "<----------------------for others refers to kali tools------------------->"
        echo "Enter hash type "
        read hashtype
        echo "Enter hash file location in txt format"
        read hashdestination
        echo "Enter file name you want output to be saved"
        read output
        echo "Select from the following Attack TYPE"
        echo "1.Single wordlist"
        echo "2.Double wordlist"
        echo "3.charset and increment"
        read select
        if [ $select -eq 1 ];
        then
            passwordfile
            hashcat -a 0 -m $hashtype $hashdestination $wordlist --outfile $output.txt 
        elif [  $select -eq 2 ];
        then  
            passwordfile
            echo "Enter from second wordlist"
            wordlist2
            hashcat -a 0 -m $hashtype $hashdestination $wordlist $wordlist_2
        elif [ $select -eq 3 ];
        then
            echo "Enter charcter set "
            read char
            echo "Enter min increment number for password"
            read min
            echo "Enter max increment number for password"
            read max
            passwordfile
            hashcat -a 3 -m $hashtype --increment --increent-min $min --increment-max $max $hashdestination $wordlist $char 
        fi 
    elif [ $hc -eq 2 ];
    then
        echo "Enter the location of rar file if want to crack file password"
        read rar
        echo "Hash of your file "
        echo "<------------------------------------------------->"
        rar2john $rar
        echo "<-------------------------------------------------->"
    fi
fi

   