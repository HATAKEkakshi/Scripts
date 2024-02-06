#!/bin/bash

echo "Choose from following Password cracking tools"
echo "1.Hashcat"
echo "2.John THe ripper"
echo "3.Hydra"
read choice
echo "Do you have hash of the file "
echo "1.Yes"
echo "2.NO"
echo "900 | MD4
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
echo "Enter hash type "
read hashtype
echo "Enter hash file location in txt format"
read hashdestination
echo "Enter wordlist location"
read wordlist
echo "Enter file name you want output to be saved"
read output
if [ $choice -eq 1 ];
then
    hashcat -a 0 -m $hashtype $hashdestination $wordlist --outfile $output.txt 
elif [$choice -eq 2 ];
then  
    echo "Enter location second wordlist"
    read wordlist2
    hashcat -a 0 -m $hashtype $hashdestination $wordlist $wordlist2
elif [$choice -eq 3 ];
then
    echo "Enter charcter set "
    read char
    echo "Enter min increment number for password"
    read min
    echo "Enter max increment number for password"
    read max
    hashcat -a 3 -m $hashtype --increment --increent-min $min --increment-max $max $hashdestination $wordlist $char 
fi