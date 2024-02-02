#!/bin/bash
echo "Enter your Mac address bit one by one"
Mac=()
for i in 0 1 2 3 4 5 
do
    read n
    Mac[i]=$n
done
echo ${Mac[@]}
for 