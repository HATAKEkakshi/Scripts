#!/bin/bash
echo "Enter your Mac address bit one by one"
Mac=()
for i in 0 1 2 3 4 5 
do
    read n
    Mac[i]=$n
done
echo ${Mac[@]}
for j in ${Mac[@]}
do
    echo "How many time you want to change mac address"
    read n
    k=0
    for n in k
    do 
        a=${Mac[0]}
        b=${Mac[1]}
        c=${Mac[2]}
        d=${Mac[3]}
        e=${Mac[4]}
        f=${Mac[5]}
        k=($k+1)
    done
done