#!/bin/bash
echo "Enter mac address of attacker spoof"
read bssid
macchanger -m $bssid eth0