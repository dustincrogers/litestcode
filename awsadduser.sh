#!/bin/bash -xe\n

#Setup new user as ldai and grant sudo access.
sudo useradd -m -g wheel ldai

#Grant ldai with ssh access:
#1.Create .ssh directory in new user home directory and change permission
sudo mkdir /home/ldai/.ssh
sudo chmod 700 /home/ldai/.ssh

#2.Create the authorized keys file in the .ssh directory and change permission
sudo cp /home/ec2-user/.ssh/authorized_keys /home/ldai/.ssh/authorized_keys
sudo chmod 600 /home/ldai/.ssh/authorized_keys

#Disable default user