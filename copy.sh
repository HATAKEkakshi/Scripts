#!/bin/bash

echo "Select Do you have multiple files"
echo "Do you have multiple files"
echo "1.Yes"
echo "2.No"
read choice
if [ $choice -eq 1 ];
then
else
    echo "Enter location of file you to copy from"
    read location
    echo "Enter location of file you want to copy it"
    read data
    cp $location $data
f