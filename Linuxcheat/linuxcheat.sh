#!/bin/bash 
deldirect(){
    echo "Ensure you are in root "
    echo "Enter name or destination of directory you want to remove"
    read k
    rm -r $k
}
directory(){
    echo "Selet from the following "
    echo "1.Single Directory"
    echo "2.Multiple Directory"
    read option
    if [ $option -eq 1 ];
    then
        deldirect
    elif [ $option -eq 2 ];
    then
        echo "Enter how many directory you want to delete(count)"
        read coun
        for ((i=1;i<=coun;i++))
        do
            deldirect
        done
    fi
}
delete(){
    echo "Enter the destination of the file or name"
    read del
    rm $del
    
}
file(){
    echo "select from the following"
    echo "1.single file"
    echo "2.Multiple files"
    read otp
    if [ $otp -eq 1 ];
    then
        delete
    elif [ $otp -eq 2 ];
    then
        echo "Enter how many file you want to remove"
        read n
        for ((i=1;i<=n;i++))
        do
           delete 
        done
    fi
}
remove(){
    echo "Select from following "
    echo "1.file"
    echo "2.Directory"
    read type
    if [ $type -eq 1 ];
    then
        file
    else
        Directory
    fi
}
move(){
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
}
n=1
while [ $n -eq 1 ];
do
    echo "<---------------------WELCOME TO LINUX CHEAT ------------------>"
    echo "Select from the following commands"
    echo "1.Copy"
    echo "2.Delete"
    echo "3.create"
    echo "4.move"
    echo "5.make exceutable file give hime permission"
    echo "6.Exit"
    echo "<-------------------------------------------------------------->"
    read choice
    if [ $choice -eq 1 ];
    then
        ./copy.sh
    elif [ $choice -eq 2 ];
    then
        remove
    elif [ $choice -eq 3 ];
    then
        echo "Enter folder name you want to create"
        read folder
        mkdir $folder
    elif [ $choice -eq 4 ];
    then
        move
    elif [ $choice -eq 5 ];
    then
        echo "Selct from the following"
        echo "1.Single file"
        echo "2.Multiple file or directory"
        read files
        if [ $files -eq 1 ];
        then
            echo "Ener file name or destination"
            read l
            chmod +x $l
        elif [ $files -eq 2 ];
        then
            chmod +x *
        fi 
    elif [ $choice -eq 6 ];
    then
        n==2
    fi
done
