#!/bin/bash

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
