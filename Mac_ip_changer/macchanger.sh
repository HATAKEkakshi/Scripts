#!/bin/bash
echo "Enter your current mac address"
read mac
ifconfig eth0 down
ifconfig eth0 hw ether $mac
ifconfig up

ifconfig eth0 down
ifconfig eth0 hw ether $mac
ifconfig