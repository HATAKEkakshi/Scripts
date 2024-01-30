#!/bin/bash

aircrak(){
    echo "Enter name of handshake file"
    read handshake
    echo "Enrer destination of handshake file"
    read passwordfile
    aircrack-ng $handshake -w $passwordfile
}

echo "Welcome to password cracker"
echo "Press 1 to continue"
read n
if [ $n -eq 1 ];
then
    aircrak
else
    "wrong Input"
fi