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
singlechoice(){
    echo "Do you have signle name to brute force"
    echo "Enter the login name you want to brute with"
    read login
    echo "Enter the password name for the brute force"
    read pass
}
anonymous(){
    echo "Do you have anonymous login"
    echo "1.Yes"
    echo "2.No"
    read iop
    if [ $iop -eq 1 ];
    then    
          n=1
        while [ $n -eq 1 ];
        do
            echo "<--------------Please Select the login user is anonymous------------------->"
            echo "1.With Password"
            echo "2.Blank Password"
            echo "3.custom Password"
            echo "4. Not an anonymous user"
            echo "<-------------------------------------------------------------------------->"
            read anonoption
            if [ $anonoption -eq 1 ];
            then
                login=anonymous
                pass=apple
            elif [ $anonoption -eq 2 ];
            then
                login=anonymous
                pass=" "
            elif [ $anonoption -eq 3 ];
            then
                login=anonymous
                echo "Enter the the password"
                read pass
            elif [ $anonoption -eq 4 ];
            then
                n=2
            fi
        echo "Do you want to continue"
        echo "1.Yes"
        echo "2.No"
        read ant
        if [ $ant -eq 1 ];
        then
            n=1
        elif [ $ant -eq 2 ];
        then
            n=2
        fi
        done
     elif [ $iop -eq 2 ];
    then
        singlechoice
    fi
  
}
hashcreator(){
    echo "Select the file formant"
    echo "1.Zip"
    echo "2.pdf"
    echo "3.rar"
    read ol
    echo "Enter the file name with extension of the file"
    read file
    echo "Enter the file name you want hash to be saved "
    read output
    if [ $ol -eq 1 ];
    then
        zip2john $file > $output.txt
    elif [ $ol -eq 2 ];
    then
        pdf2john $file > $output.txt
    elif [ $ol -eq 3 ];
    then
        rar2john $file > $output.txt
    fi
}
choosefile(){
    echo "<--------------------For Username wordlist-------------------------->"
    echo "1. Username"
    echo "2. Password file"
    echo "3.Custom"
    echo "<-------------------------------------------------------------------->"
    read choice
    if [ $choice -eq 1 ];
    then
        username
    elif [ $choice -eq 2 ];
    then
        passwordfile
    elif [ $choice -eq 3 ];
    then
        echo "Enter the destination or name of file"
        read wordlist
    fi
}
ftp(){
    target_ip
    echo "Enter the time you want it pe repeat"
    read time
    service=ftp
    echo "Do you have single word or a wordlist to brute force with"
    echo "1. Wordlist"
    echo "2. Single Word"
    read uj
    if [ $uj -eq 1 ];
    then
        echo "Choose for password file"
        choosefile
        echo "Choose for login or usernaem list"
        wordlist2
        hydra -L $wordlist_2 -P $wordlist $service://$targetip -V -t $time
    elif [ $uj -eq 2 ];
    then
        anonymous
        hydra -l $login -p $pass $service://$targetip -V -t $time
    fi
    
}
ssh(){
    target_ip
    echo "Enter the time you want it pe repeat"
    read time
    service=ssh
    echo "Do you have single word or a wordlist to brute force with"
    echo "1. Wordlist"
    echo "2. Single Word"
    read kj
    if [ $kj -eq 1 ];
    then
        echo "Choose for password file"
        choosefile
        echo "Choose for login or usernaem list"
        wordlist2
        hydra -L $wordlist_2 -P $wordlist $service://$targetip -V -t $time
    elif [ $kj -eq 2 ];
    then
         singlechoice
         hydra -l $login -p $pass $service://$targetip -V -t $time
    fi
}
telnet(){
    target_ip
    echo "Enter the time you want it pe repeat"
    read time
    service=telnet
    echo "Do you have single word or a wordlist to brute force with"
    echo "1. Wordlist"
    echo "2. Single Word"
    read po
    if [ $po -eq 1 ];
    then
         echo "Choose for password file"
        choosefile
        echo "Choose for login or usernaem list"
        wordlist2
        hydra -L $wordlist_2 -P $wordlist $service://$targetip -V -t $time
    elif [ $po -eq 2 ];
    then
        singlechoice
        hydra -l $login -p $pass $service://$targetip -V -t $time
    fi
}
mysql(){
    target_ip
    echo "Enter the time you want it pe repeat"
    read time
    service=mysql
    echo "Do you have single word or a wordlist to brute force with"
    echo "1. Wordlist"
    echo "2. Single Word"
    read io
    if [ $io -eq 1 ];
    then
          echo "Choose for password file"
          choosefile
          echo "Choose for login or usernaem list"
          wordlist2
          hydra -L $wordlist_2 -P $wordlist $service://$targetip -V -t $time
    elif [ $io -eq 2 ];
    then
         singlechoice
         hydra -l $login -p $pass $service://$targetip -V -t $time
    fi
}
yourdirect(){
    direct=/home/hatakekakashi/
}
wordlist2(){
    passwordfile
    wordlist=wordlist_2
}
username(){
    echo "<----------------SELECT FROM THE FOLLOWING LIST---------------------------------->"
    echo "1.Honeypot-Captures"
    echo "2.Names"
    echo "Other Miscelloues "
    read user
    if [ $user -eq 1 ];
    then
        userlist=$direct/SecLists/Usernames/multiplesources-users-fabian-fingerle.de.txt
    elif [ $user -eq 2 ];
    then
        echo "<------------------SELECT FROM THE FOLLOWING USERLIST--------------------->"
        echo "1.Username List"
        echo "2.Username List"
        echo "3.Username List"
        echo "4.Username List"
        echo "5.Username List"
        echo "6.Username List"
        echo "7.Username List"
        echo "<---------------------------------------------------------------------------->"
        read uel
        if [ $uel -eq 1 ];
        then
            userlist=$direct/SecLists/Usernames/cirt-default-usernames.txt  
        elif [ $uel -eq 2 ];
        then
            userlist=$direct/SecLists/Usernames/CommonAdminBase64.txt  
        elif [ $uel -eq 3];
        then
            userlist=$direct/SecLists/Usernames/mssql-usernames-nansh0u-guardicore.txt
        elif [ $uel -eq 4 ];
        then
            userlist=$direct/SecLists/Usernames/sap-default-usernames.txt
        elif [ $uel -eq 5 ];
        then
            userlist=$direct/SecLists/Usernames/top-usernames-shortlist.txt
        elif [ $uel -eq 6 ];
        then
            userlist=$direct/SecLists/Usernames/xato-net-10-million-usernames-dup.txt
        elif [ $uel -eq 7 ];
        then
            userlist=$direct/SecLists/Usernames/xato-net-10-million-usernames.txt
        fi
    elif [ $user -eq 3 ];
    then
        echo "<------------------SELECT FROM THE FOLLOWING USERLIST--------------------->"
        echo "1.Username List"
        echo "2.Username List"
        echo "3.Username List"
        echo "4.Username List"
        echo "5.Username List"
        echo "6.Username List"
        echo "7.Username List"
        echo "<---------------------------------------------------------------------------->"
        read iop
        if [ $iop -eq 1 ];
        then
            userlist=$direct/SecLists/Usernames/familynames-usa-top1000.txt 
        elif [ $iop -eq 2 ];
        then
            userlist=$direct/SecLists/Usernames/forenames-india-top1000.txt
        elif [ $iop -eq 3 ];
        then
            userlist=$direct/SecLists/Usernames/names.txt
        elif [ $iop -eq 4 ];
        then
            userlist=$direct/SecLists/Usernames/femalenames-usa-top1000.txt
        elif [ $iop -eq 5 ];
        then
            userlist=$direct/SecLists/Usernames/malenames-usa-top1000.txt
        fi
    fi
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
        echo "11.Default Creditinals"
        echo "12.Permutaions"
        echo "13.Keyboard-walks"
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
        elif [ $cracked -eq 5 ];
        then
            echo "<------------------SELECT FROM THE FOLLOWING---------------------------->"
            echo "1.Password List 1"
            echo "2.Password List 2"
            echo "3.Password List 3"
            echo "<---------------------------------------------------------------------->"
            read we
            if [ $we -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/WiFi-WPA/probable-v2-wpa-top447.txt
            elif [ $we -eq 2 ];
            then
                wordlist=$direct/SecLists/Passwords/WiFi-WPA/probable-v2-wpa-top62.txt
            elif [ $we -eq 3 ];
            then
                wordlist=$direct/SecLists/Passwords/WiFi-WPA/probable-v2-wpa-top4800.txt
            fi
        elif [ $cracked -eq 6 ];
        then
            echo "<-------------------- SELECT FROM THE FOLLOWING LIST-------------------->"
            echo "1.Password List  01"
            echo "2.Password List  02"
            echo "3.Password List  03"
            echo "4.Password List  04"
            echo "5.Password List  05"
            echo "6.Password List  06"
            echo "7.Password List  07"
            echo "8.Password List  08"
            echo "9.Password List  09"
            echo "10.Password List 10"
            echo "11.Password List 11"
            echo "12.Password List 12"
            echo "13.Password List 13"
            echo "14.Password List 14"
            echo "15.Password List 15"
            echo "16.Password List 16"
            echo "17.Password List 17"
            echo "18.Password List 18"
            echo "19.Password List 19"
            echo "20.Password List 20"
            echo "21.Password List 21"
            echo "<---------------------------------------------------------------------------------------->"
            read kl
            if [ $kl -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/10k-most-common.txt 
            elif [ $kl -eq 2 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/10-million-password-list-top-100.txt 
            elif [ $kl -eq 3 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/10-million-password-list-top-500.txt
            elif [ $kl -eq 4 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/10-million-password-list-top-1000.txt
            elif [ $kl -eq 5 ];
            then 
                wordlist=$direct/SecLists/Passwords/Common-Credentials/10-million-password-list-top-10000.txt 
            elif [ $kl -eq 6 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/10-million-password-list-top-100000.txt 
            elif [ $kl -eq 7 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/10-million-password-list-top-1000000.txt
            elif [ $kl -eq 8 ];
            then 
                wordlist=$direct/SecLists/Passwords/Common-Credentials/500-worst-passwords.txt
            elif [ $kl -eq 9 ];
            then 
                 wordlist=$direct/SecLists/Passwords/Common-Credentials/1900-2020.txt
            elif [ $kl -eq 10 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/best15.txt 
            elif [ $kl -eq 11 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/best10.txt 
            elif [ $kl -eq 12 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/best1050.txt 
            elif [ $kl -eq 13 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/common-passwords-win.txt 
            elif [ $kl -eq 14 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/four-digit-pin-codes-sorted-by-frequency-withcount.csv 
            elif [ $kl -eq 15 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/medical-devices.txt 
            elif [ $kl -eq 16 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/SplashData-2014.txt
            elif [ $kl -eq 17 ];
            then 
                wordlist=$directSecLists/Passwords/Common-Credentials/SplashData-2015-1.txt 
            elif [ $kl -eq 18 ];
            then
                wordlist=$direct/SecLists/Passwords/Common-Credentials/SplashData-2015-2.txt
            elif [ $kl -eq 19 ];
            then 
                wordlist=$direct/SecLists/Passwords/Common-Credentials/top-20-common-SSH-passwords.txt 
            elif [ $kl -eq 20 ];
            then
            wordlist=$direct/SecLists/Passwords/Common-Credentials/top-passwords-shortlist.txt 
            elif [ $kl -eq 21 ];
            then
            wordlist=$direct/SecLists/Passwords/Common-Credentials/worst-passwords-2017-top100-slashdata.txt 
            fi
        elif [ $cracked -eq 7 ];
        then
            echo "1.Password List 01"
            echo "2.Password List 02"
            read lt
            if [ $lt -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/Software/cain-and-abel.txt
            elif [ $lt -eq 2 ];
            then
                wordlist=$direct/SecLists/Passwords/Software/john-the-ripper.txt
            fi
        elif [ $cracked -eq 8 ];
        then
            wordlist=$direct/SecLists/Passwords/Cracked-Hashes/milw0rm-dictionary.txt
        elif [ $cracked -eq 9 ];
        then
            echo "<----------------------------SELECT FROM THE FOLLOWING PASSWORD LIST---------------------------->"
            echo "Password List     01"
            echo "2.Password List   02"
            echo "3.Password List   03"
            echo "4.Password List   04"
            echo "5.Password List   05"
            echo "6.Password List   06"
            echo "7.Password List   07"
            echo "8.Password List   08"
            echo "9.Password List   09"
            echo "10.Password List  10"
            echo "11.Password List  11"
            echo "12.Password List  12"
            echo "13.Password List  13"
            echo "14.Password List  14"
            echo "15.Password List  15"
            echo "16.Password List  16"
            echo "17.Password List  17"
            echo "18.Password List  18"
            echo "19.Password List  19"
            echo "20.Password List  20"
            echo "21.Password List  21"
            echo "22.Password List  22"
            echo "23.Password List  23"
            echo "24.Password List  24"
            echo "25.Password List  25"
            echo "26.Password List  26"
            echo "27.Password List  27"
            echo "28.Password List  28"
            echo "29.Password List  29"
            echo "30.Password List  30"
            echo "31.Password List  31"
            echo "32.Password List  32"
            echo "33.Password List  33"
            echo "34.Password List  34"
            echo "35.Password List  35"
            echo "36.Password List  36"
            echo "37.Password List  37"
            echo "38.Password List  38"
            echo "39.Password List  39"
            echo "40.Password List  40"
            echo "41.Password List  41"
            echo "42.Password List  42"
            echo "43.Password List  43"
            echo "<-------------------------------------------------------------------------------------------------->"
            read ws
            if [ $ws -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/xato-net-10-million-passwords-1000000.txt
            elif [ $ws -eq 2 ];
            then
                wordlist=$direct/SecLists/Passwords/xato-net-10-million-passwords-100000.txt
            elif [ $ws -eq 3 ];
            then
                wordlist=$direct/SecLists/Passwords/xato-net-10-million-passwords-10000.txt
            elif [ $ws -eq 4 ];
            then
                wordlist=$direct/SecLists/Passwords/xato-net-10-million-passwords-1000.txt
            elif [ $ws -eq 5 ];
            then
                wordlist=$direct/SecLists/Passwords/xato-net-10-million-passwords-100.txt
            elif [ $ws -eq 6 ];
            then
                wordlist=$direct/SecLists/Passwords/xato-net-10-million-passwords-10.txt
            elif [ $ws -eq 7 ];
            then
                 wordlist=$direct/SecLists/Passwords/xato-net-10-million-passwords-dup.txt
            elif [ $ws -eq 8 ];
            then
                wordlist=$direct/SecLists/Passwords/months.txt 
            elif [ $ws -eq 9 ];
            then                       
                wordlist=$direct/SecLists/Passwords/xato-net-10-million-passwords.txt
            elif [ $ws -eq 10 ];
            then
                wordlist=$direct/SecLists/Passwords/der-postillon.txt 
            elif [ $ws -eq 11 ];
            then
                wordlist=$direct/SecLists/Passwords/dutch_common_wordlist.txt
            elif [ $ws -eq 12 ];
            then
                wordlist=$direct/SecLists/Passwords/dutch_passwordlist.txt 
            elif [ $ws -eq 13 ];
            then
                wordlist=$direct/SecLists/Passwords/2020-200_most_used_passwords.txt 
            elif [ $ws -eq 14 ];
            then 
                 wordlist=$direct/SecLists/Passwords/Most-Popular-Letter-Passes.txt
            elif [ $ws -eq 15 ];
            then
                 wordlist=$direct/SecLists/Passwords/2023-200_most_used_passwords.txt  
            elif [ $ws -eq 16 ];
            then
                wordlist=$direct/SecLists/Passwords/mssql-passwords-nansh0u-guardicore.txt
            elif [ $ws -eq 17 ];
            then
                wordlist=$direct/SecLists/Passwords/500-worst-passwords.txt     
            elif [ $ws -eq 18 ];
            then      
                wordlist=$direct/SecLists/Passwords/openwall.net-all.txt
            elif [ $ws -eq 19 ];
            then
                wordlist=$direct/SecLists/Passwords/500-worst-passwords.txt.bz2  
            elif [ $ws -eq 20 ];
            then                              
                wordlist=$direct/SecLists/Passwords/PHP-Magic-Hashes.txt
            elif [ $ws -eq 21 ];
            then
                wordlist=$direct/SecLists/Passwords/bt4-password.txt 
            elif [ $ws -eq 22 ];
            then                 
                wordlist=$direct/SecLists/Passwords/probable-v2-top12000.txt
            elif [ $ws -eq 23 ];
            then
                wordlist=$direct/SecLists/Passwords/cirt-default-passwords.txt       
            elif [ $ws -eq 24 ];
            then 
                wordlist=$direct/SecLists/Passwords/probable-v2-top1575.txt
            elif [ $ws -eq 25 ];
            then
                wordlist=$direct/SecLists/Passwords/citrix.txt         
            elif [ $ws -eq 26 ];
            then               
                wordlist=$direct/SecLists/Passwords/probable-v2-top207.txt
            elif [ $ws -eq 27 ];
            then
                wordlist=$direct/SecLists/Passwords/clarkson-university-82.txt   
            elif [ $ws -eq 28 ];
            then     
                wordlist=$direct/SecLists/Passwords/common_corporate_passwords.lst  
            elif [ $ws -eq 29 ];
            then  
                wordlist=$direct/SecLists/Passwords/richelieu-french-top20000.txt     
            elif [ $ws -eq 30 ];
            then           
                wordlist=$direct/SecLists/Passwords/richelieu-french-top5000.txt      
            elif [ $ws -eq 31 ];
            then             
                wordlist=$direct/SecLists/Passwords/SCRABBLE-hackerhouse.tgz
            elif [ $ws -eq 32 ];
            then
                wordlist=$direct/SecLists/Passwords/darkc0de.txt       
            elif [ $ws -eq 33 ];
            then              
                wordlist=$direct/SecLists/Passwords/scraped-JWT-secrets.txt
            elif [ $ws -eq 34 ];
            then
                wordlist=$direct/SecLists/Passwords/darkweb2017-top10000.txt     
            elif [ $ws -eq 35 ];
            then     
                wordlist=$direct/SecLists/Passwords/seasons.txt
            elif [ $ws -eq 36 ];
            then
                wordlist=$direct/SecLists/Passwords/darkweb2017-top1000.txt   
            elif [ $ws -eq 37 ];
            then        
                wordlist=$direct/SecLists/Passwords/darkweb2017-top100.txt   
            elif [ $ws -eq 38 ];
            then         
                wordlist=$direct/SecLists/Passwords/stupid-ones-in-production.txt
            elif [ $ws -eq 39 ];
            then
                wordlist=$direct/SecLists/Passwords/darkweb2017-top10.txt             
            elif [ $ws -eq 40 ];
            then
                wordlist=$direct/SecLists/Passwords/twitter-banned.txt
            elif [ $ws -eq 41 ];
            then
                wordlist=$direct/SecLists/Passwords/days.txt       
            elif [ $ws -eq 42 ];
            then                   
                wordlist=$direct/SecLists/Passwords/unkown-azul.txt
            elif [ $ws -eq 43 ];
            then
                wordlist=$direct/SecLists/Passwords/UserPassCombo-Jay.txt
            fi
        elif [ $cracked -eq 10 ];
        then
            echo "<---------------SELECT FROM THE FOLLOWING LIST------------->"
            echo "1.Password List 01"
            echo "2.Password List 02"
            echo "3.Password List 03"
            echo "4.Password List 04"
            echo "5.Password List 05"
            echo "6.Password List 06"
            echo "<------------------------------------------------------------->"
            read lp
            if [ $lp -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/Wikipedia/wikipedia_de_vowels_no_compounds_top-1000000.txt
            elif [ $lp -eq 2 ];
            then
                wordlist=$direct/SecLists/Passwords/Wikipedia/wikipedia_en_vowels_no_compounds_top-1000000.txt
            elif [ $lp -eq 3 ];
            then
                wordlist=$direct/SecLists/Passwords/Wikipedia/wikipedia_es_vowels_no_compounds_top-1000000.txt
            elif [ $lp -eq 4 ];
            then
                wordlist=$direct/SecLists/Passwords/Wikipedia/wikipedia_fr_vowels_no_compounds_top-1000000.txt
            elif [ $lp -eq 5 ];
            then
                wordlist=$direct/SecLists/Passwords/Wikipedia/wikipedia_pt_vowels_no_compounds_top-1000000.txt
            elif [ $lp -eq 6 ];
            then
                wordlist=$direct/SecLists/Passwords/Wikipedia/wikipedia_tr_vowels_no_compounds_top-1000000.txt
        elif [ $cracked -eq 11 ];
        then
            echo "<-------------------------------SELECT FROM THE FOLLOWING LIST-------------------------------->"
            echo "Password List     01"
            echo "2.Password List   02"
            echo "3.Password List   03"
            echo "4.Password List   04"
            echo "5.Password List   05"
            echo "6.Password List   06"
            echo "7.Password List   07"
            echo "8.Password List   08"
            echo "9.Password List   09"
            echo "10.Password List  10"
            echo "11.Password List  11"
            echo "12.Password List  12"
            echo "13.Password List  13"
            echo "14.Password List  14"
            echo "15.Password List  15"
            echo "16.Password List  16"
            echo "17.Password List  17"
            echo "18.Password List  18"
            echo "19.Password List  19"
            echo "20.Password List  20"
            echo "<----------------------------------------------------------------------------------------------->"
            read uh
            if [ $uh -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/avaya_defaultpasslist.txt
            elif [ $uh -eq 2 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/cryptominers.txt
            elif [ $uh -eq 3 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/db2-betterdefaultpasslist.txt
            elif [ $uh -eq 4 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/default-passwords.csv
            elif [ $uh -eq 5 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/default-passwords.txt
            elif [ $uh -eq 6 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/ftp-betterdefaultpasslist.txt
            elif [ $uh -eq  7 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/mssql-betterdefaultpasslist.txt
            elif [ $uh -eq 8 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/mysql-betterdefaultpasslist.txt
            elif [ $uh -eq 9 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/oracle-betterdefaultpasslist.txt
            elif [ $uh -eq 10 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/'Oracle EBS passwordlist.txt'
            elif [ $uh -eq 11 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/'Oracle EBS userlist.txt'
            elif [ $uh -eq 12 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/postgres-betterdefaultpasslist.txt
            elif [ $uh -eq 13 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/scada-pass.csv
            elif [ $uh -eq 14 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/ssh-betterdefaultpasslist.txt
            elif [ $uh -eq 15 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/telnet-betterdefaultpasslist.txt
            elif [ $uh -eq 16 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/telnet-phenoelit.txt
            elif [ $uh -eq 17 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/tomcat-betterdefaultpasslist_base64encoded.txt
            elif [ $uh -eq 18 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/tomcat-betterdefaultpasslist.txt
            elif [ $uh -eq 19 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/vnc-betterdefaultpasslist.txt
            elif [ $uh -eq 20 ];
            then
                wordlist=$direct/SecLists/Passwords/Default-Credentials/windows-betterdefaultpasslist.txt
            fi
        elif [ $cracked -eq 12 ];
        then
            echo "<-------------------------SELECT FRM THE FOLLOWING LIST---------------------------->"
            echo "1.Password List 01"
            echo "2.Password List 02"
            echo "3.Password List 03"
            echo "<---------------------------------------------------------------------------------->"
            read ops
            if [ $ops -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/Permutations/1337speak.txt
            elif [ $ops -eq 2 ];
            then 
                wordlist=$direct/SecLists/Passwords/Permutations/korelogic-password.txt
            elif [ $ops -eq 3 ];
            then
                wordlist=$direct/SecLists/Passwords/Permutations/password-permutations.txt
            fi
        elif [ $cracked -eq 13 ];
        then
            echo "<------------------SELECT FROM THE FOLLOWING LIST------------------------------>"
            echo "1.Password List 01"
            echo "2.Password List 02"
            echo "<------------------------------------------------------------------------------->"
            read cs
            if [ $cs -eq 1 ];
            then
                wordlist=$direct/SecLists/Passwords/Keyboard-Walks/Keyboard-Combinations.txt 
            elif [ $cs -eq 2 ];
            then
                wordlist=$direct/SecLists/Passwords/Keyboard-Walks/walk-the-line.txt
            fi
        fi
    fi
    else
        echo "Enter the destination of the file of wordlist"
        read open
        wordlist=$open
     fi 
}

echo "<------------------------Select format of Password you want to crack--------------------------------->"
echo "1.Protocol type"
echo "2.Wifi password"
echo "3.File password/hashes"
echo "4.Hash Creator"
echo "<---------------------------------------------------------------------------------------------------->"
read type
if [ $type -eq 1 ];
then
    echo "<--------------------SELECT THE SERVICE TYPE------------------------>"
    echo "1.FTP"
    echo "2.SSH"
    echo "3.Telnet"
    echo "4.MySql"
    echo "<------------------------------------------------------------------->"
    read oi
    if [ $oi -eq 1 ];
    then
           ftp
    elif [ $oi -eq 2 ];
    then
            ssh
    elif [ $oi -eq 3 ];
    then
        telnet
    elif [ $oi -eq 4 ];
    then
        mysql
    fi
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
      hashcreator
    fi
elif [ $type -eq 4 ];
then
    hashcreator
fi


