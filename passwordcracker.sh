#!/bin/bash
echo "Select format of password you want to crack"
echo "1.Protocol type"
echo "2.Wifi password"
echo "3.File password/hashes"
read type
if [ $type -eq 1 ];
then
    echo "under construnction"
elif [ $type -eq 2 ];
then
    echo "Under construnction"
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
        echo "Enter wordlist location"
        read wordlist
        echo "Enter file name you want output to be saved"
        read output
        echo "Select from the following Attack TYPE"
        echo "single wordlist"
        echo "Double wordlist"
        echo "charset and increment"
        read select
        if [ $select -eq 1 ];
        then
            hashcat -a 0 -m $hashtype $hashdestination $wordlist --outfile $output.txt 
        elif [  $select -eq 2 ];
        then  
            echo "Enter location second wordlist"
            read wordlist2
            hashcat -a 0 -m $hashtype $hashdestination $wordlist $wordlist2
        elif [$select -eq 3 ];
        then
            echo "Enter charcter set "
            read char
            echo "Enter min increment number for password"
            read min
            echo "Enter max increment number for password"
            read max
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

   