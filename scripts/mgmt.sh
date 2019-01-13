#!/usr/bin/env bash


sleep 5

#Check for ping connectivity to google before proceeding.

ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]
then
	echo "connectivity is there"
else    echo "connectivity is not there"
        exit 1 
fi 

 
echo "Add dns names to etc hosts"

sudo echo 10.1.1.201 leaf1  >> /etc/hosts
sudo echo 10.1.1.202 leaf2  >> /etc/hosts

echo "updating apt-get"
sudo apt-get update -y 
echo "installing everything necessary for DNS and Bind"
sudo apt-get install -y git ansible python-pip python-dev default-jre libffi-dev libssl-dev python-dev python-cffi libxslt1-dev python-pip -y 

echo "Install napalm EOS libraries"
sudo pip install napalm
sudo pip install napalm-logs

echo "upgrading pip"
sudo pip install -U pip setuptools
sudo pip install --upgrade pip

echo "Get the necessary libraries"
sudo pip install jsonrpclib