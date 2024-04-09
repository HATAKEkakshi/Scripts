#!/bin/bash
figlet "OSNIT" -c 
echo "Enter the target name"
read name
echo "DO you have target phonenumber"
echo "1.Yes"
echo "2.No"
read phone_choice
if [ $phone_choice -eq 1 ];
then
    echo "Enter phone number"
    read number
    truecallerjs -s +91$number
elif [ $phone_choice -eq 2 ];
then
    break
fi
echo "Do you have target username"
echo "1.Yes"
echo "2.No" 
read choice
if [ $choice -eq 1 ];
then
    echo "coming_soon"
elif [ $choice -eq 2 ];
then
    break
fi
echo "Enter instagram username"
echo "Enter how many target photo you have"
read n
for (( i=1;i<=n;i++));
do
    read target_$i
    exiv2 pr target_$i
done
