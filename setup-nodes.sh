#!/bin/bash
#To get all the tools install
sudo apt get update -y && apt install -y git nano batctl net-tools dnsmasq libnl-genl-3-dev network-manager

#if batctl is not installed correctly
sudo git clone https://github.com/open-mesh-mirror/batctl
cd batctl
sudo make install

echo 'batman-adv' | tee --append /etc/modules
echo 'denyinterfaces wlan0' | tee --append /etc/dhcpcd.conf
echo sudo cp bat0 /etc/network/interfaces.d/bat0
sudo cp wlan0 /etc/network/interfaces.d/wlan0
sudo chmod +x /start-batman-adv.sh
./start-batman-adv.sh

#Setup Done, notify to set the script to start up
echo "Node Setup completed, please append the following lines to /etc/rc.local"
echo "/home/pi/start-batman-adv.sh &"
echo "Before: exit 0"