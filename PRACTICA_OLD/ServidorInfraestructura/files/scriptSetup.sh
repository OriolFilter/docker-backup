#!/bin/bash


sudo apt-get update # bruh
#sudo apt-get upgrade


# Netplan, esta configurat a l'script VBoxManager.sh
#sudo apt install netplan
#sudo mv ./netplan.yaml /etc/dhcpd/dhcpd.conf

# DHCP
sudo apt install isc-dhcp-server --fix-missing
sudo mv ./dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
sudo service isc-dhcp-server stop
sudo service isc-dhcp-server start


# DNS
sudo apt-get install bind9
sudo mv ./bind/* /etc/bind/
sudo service bind9 stop && sudo service bind9 start


# Resolv
sudo mv resolv.conf /etc/resolv.conf
