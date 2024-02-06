#!/bin/bash
move(){
    echo "Select from the following function"
    echo "Multiple files to move"
    echo "single file to move"
    read opt
    if [ $opt -eq 1 ];
    then
        echo "how many file you want to move"
        read n
        for ((i=1;i<=n;i++))
        do
            echo "Enter the name or location of file that has to be moved"
            read traget
            echo "Enter the destination where it has to be moved"
            read victim
            mv $traget $victim
        done 
    else
        echo "Enter the file name you want to move"
        read tra
        echo "Enter the destination where it has to be moved"
        read vic
        mv $tra $vic
    fi 
}
echo "<---------------------WELCOME TO LINUX CHEAT ------------------>"
echo "Select from the following commands"
echo "1.Copy"
echo "2.Delete"
echo "3.create"
echo "4.move"
echo "<-------------------------------------------------------------->"
read choice
if [ $choice -eq 1 ];
then
    ./copy.sh
elif [ $choice -eq 2 ];
then
    ./remove.sh
elif [ $choice -eq 3 ];
then
    echo "Enter folder name you want to create"
    read folder
    mkdir $folder
elif [ $choice -eq 4 ];
then
    ./move.sh
fi
