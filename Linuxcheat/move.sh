#!/bin/bash

echo "Select from the following function"
echo "1.Multiple files to move"
echo "2.single file to move"
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