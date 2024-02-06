#!/bin/bash
loopcopy(){
    echo "Do you multiple files from same folder"
    echo "1.Yes"
    echo "2.No"
    read cho
    if [ $cho -eq 1 ];
    then
        echo "Enter destination of fixed folder"
        read destination
        echo "Enter name or destination of folder or file in which data has to be copied to"
        read master
        echo "Enter how many multiple file of the same folder you have"
        read n
        for ((i=1;i<=n;i++))
        do
            echo "Enter file name"
            read filename
            cp $destination/$filename $master
        done  

    fi 
}
echo "Select Do you have multiple files"
echo "Do you have multiple files"
echo "1.Yes"
echo "2.No"
read choice
if [ $choice -eq 1 ];
then
    loopcopy
else
    echo "Enter location of file you to copy from"
    read location
    echo "Enter location of file you want to copy it"
    read data
    cp $location $data
f