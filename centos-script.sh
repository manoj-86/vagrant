#!/bin/bash
USER=root
PASSWORD='redhat'
A='192.168.56.13'
B='192.168.56.14'
C='192.168.56.15'
sudo -i
 sed -i -e 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
 sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
 sed -i -e 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
 systemctl restart sshd 
#sudo apt-get update &> /dev/null 
#sudo apt-get install -y wget vim curl net-tools &> /dev/null
#IP=`hostname -i | awk -F '.' '{ print $4 }'` 
IP=`ip a | tail -4 | head -1 | awk -F  " " '{print $2}' | cut -c 1-13` 
	if [ $A == $IP ] 
          then
        	sudo hostnamectl set-hostname server1.example.com
	else
          if [ $B == $IP ] 
           then
		sudo hostnamectl set-hostname server2.example.com
	else
         if [ $C == $IP ] 
          then
		sudo hostnamectl set-hostname server3.example.com
	else
		echo "$IP address is not in range"
	fi
        fi 
        fi 



sudo echo "192.168.56.11 node1 node1.example.com" >> /etc/hosts
sudo echo "192.168.56.12 node2 node2.example.com" >> /etc/hosts
sudo echo "192.168.56.10 master master.example.com" >> /etc/hosts
sudo echo "192.168.56.13 server1 server1.example.com" >> /etc/hosts
sudo echo "192.168.56.14 server2 server2.example.com" >> /etc/hosts
sudo echo "192.168.56.15 server3 server3.example.com" >> /etc/hosts
sudo -i 
echo  "redhat" | passwd --stdin root
