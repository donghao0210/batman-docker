#!/bin/bash
#To get all the tools install
sudo apt update -y && apt install -y git nano batctl net-tools dnsmasq libnl-genl-3-dev libnl-3-dev network-manager

#if batctl is not installed correctly
sudo git clone https://github.com/open-mesh-mirror/batctl
cd batctl
sudo make install
cd ~/batman-setup

echo 'batman-adv' | tee --append /etc/modules
echo 'denyinterfaces wlan0' | tee --append /etc/dhcpcd.conf
echo "copying bat0 to interface"
sudo cp bat0 ~/etc/network/interfaces.d/bat0
echo "copying bat0 to wlan0"
sudo cp wlan0 ~/etc/network/interfaces.d/wlan0
echo "Giving exceute permission to start-batman-adv.sh"
sudo chmod +x /start-batman-adv.sh
./start-batman-adv.sh

#Setup Done, notify to set the script to start up
echo "Node Setup completed, please append the following lines to /etc/rc.local"
echo "/home/pi/start-batman-adv.sh &"
echo "Before: exit 0"