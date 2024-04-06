#!/bin/bash
figlet "Updater" -c 
update(){
    apt update && apt upgrade
}
echo "Do you want to upgrade"
read n
if [ $n -eq 1 ];
then
    update
fi