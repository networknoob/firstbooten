#!/bin/bash
RED='\033[0;31m'
BLUE='\033[0;36m'
NC='\033[0m'

read -p "Please enter the hostname for this system:" hostname
echo -e "\nThe hostname for this system will be: ${BLUE}$hostname\n${NC} "
read -p "Please enter the IP address of this system:" ip
echo $hostname > ./hostname
echo Checking if $ip is already in use...
if ping -c 1 $ip 1>/dev/null 2>/dev/null
then
echo -e "${RED}WARNING:${NC} $ip is in use, please pick another address!"
echo -e "${RED}Exiting...."
exit
else
echo -e "\nThe ip for this system will be: ${BLUE}$ip\n${NC}"
echo "# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug ens18
iface ens18 inet static
address $ip 
gateway 10.0.0.1
netmask 255.255.255.0" > ./ipconf
fi

