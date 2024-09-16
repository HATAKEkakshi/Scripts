#!/bin/bash
figlet "Git" -c
n=2
while [ $n -eq 2 ];
do
    echo "Select from the following Operations"
    echo "1.Cloning the Repoistary"
    echo "2.Checking Status"
    echo "3.Tracked file"
    echo "4.Commit"
    echo "5.Push"
    echo "6.Done All the work at once"
    read choice
    if choice[ $choice -eq 1 ];
    then
        echo "Enter cloning repositroy link"
        read link
        git clone $link
    elif [ $choice -eq 2 ];
    then
        git status
    elif [ $choice -eq 3 ];
    then
        git add .
    elif [ $choice -eq 4 ];
    then
        echo "Enter commit message"
        read message
        git commit -m "$message"
    elif [ $choice -eq 5 ];
    then
        git push
    elif [ $choice -eq 6 ];
    then
        git status
        git add .
        echo "Enter commit message"
        read message
        git commit -m $message
        git push
    fi
done