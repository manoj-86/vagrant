#!/bin/bash
USER=root
paad='redhat'
A='192.168.56.10'
B='192.168.56.11'
C='192.168.56.12'
sudo sed -i -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i -e 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd 
sudo apt-get update &> /dev/null 
sudo apt-get install -y wget vim curl net-tools &> /dev/null 
#sudo hostnamectl set-hostname master.example.com 
IP=`ip a | tail -4 | head -1 | awk -F " " '{print $2}' | cut -c 1-13` 

	if [ "$A" = "$IP" ]
          then
            sudo hostnamectl set-hostname master.example.com
	else
          if [ "$B" = "$IP" ] 
           then
		sudo hostnamectl set-hostname node1.example.com
	else
          if [ "$C" = "$IP" ]
           then
		sudo hostnamectl set-hostname node2.example.com
	else
		echo " IP address is not in range"
	fi
        fi
        fi

sudo echo "192.168.56.11 node1 node1.example.com" >> /etc/hosts
sudo echo "192.168.56.12 node2 node2.example.com" >> /etc/hosts
sudo echo "192.168.56.10 master master.example.com" >> /etc/hosts
sudo echo "192.168.56.13 server1 server1.example.com" >> /etc/hosts
sudo echo "192.168.56.14 server2 server2.example.com" >> /etc/hosts
sudo echo "192.168.56.15 server3 server3.example.com" >> /etc/hosts
sudo echo  "root:redhat" | sudo  chpasswd
