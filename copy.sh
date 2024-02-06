#!/bin/bash
menu(){
    echo "<-----------Select from the following menu-------->"
    diffmaster
}
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
    else
        echo "Count how many different files you have in diff folder"
        read x 
        for ((i=1;i<=x;i++))
        do
            echo "Enter destination of diff files "
            read des
            echo "Enter destination copied folder"
            read copi
            cp $des $copi 
        done 
    fi 
}
diffmaster(){
    echo "Do you have multiple copy folder means you want copy content from multiple file to multiple other file not a single file"
    echo "1.If you have Multiple diff coping file"
    echo "2.single master"
    read g
    if [ $g -eq 1 ];
    then
        echo "Count how many files you have for copy"
        read k
        for ((i=1;i<=k;i++))
        do
            echo "Enter the location of copying from folders"
            read l
            echo "Enter the location or name of multiple masters "
            read master
            cp $l $master
        done 
    elif [ $g -eq 2 ];
    then 
        loopcopy
    fi 
}
echo "Select Do you have multiple files"
echo "Do you have multiple files"
echo "1.Yes"
echo "2.No"
read choice
if [ $choice -eq 1 ];
then
    menu
else
    echo "Enter location of file you to copy from"
    read location
    echo "Enter location of file you want to copy it"
    read data
    cp $location $data
fi 