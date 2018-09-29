#!/bin/bash
#Setup my website
sudo yum install httpd -y
sudo apachectl start
sudo aws s3 sync s3://liserverbucket/html /var/www/html/
#Setup new user as ldai and grant sudo access.
sudo useradd -m -g wheel -p $(echo ec2dmm890904 | openssl passwd -1 -stdin) ldai
#Grant ldai with ssh access:
#1.Create .ssh directory in new user home directory and change permission
sudo mkdir /home/ldai/.ssh
sudo chmod 700 /home/ldai/.ssh
#2.Create the authorized keys file in the .ssh directory
sudo cp /home/ec2-user/.ssh/authorized_keys /home/ldai/.ssh/authorized_keys
sudo chmod 600 /home/ldai/.ssh/authorized_keys
sudo chown ldai /home/ldai/.ssh/
sudo chown ldai /home/ldai/.ssh/authorized_keys
#Disable default user login
mv ~ec2-user/.ssh/authorized_keys ~ec2-user/.ssh/disabled_keys