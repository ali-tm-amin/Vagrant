#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
#systemctl status nginx
sudo apt-get install nodejs -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g
sudo rm -rf /etc/nginx/sites-availabile/default
sudo ls -s default /etc/nginx/sites-available/
echo 'export DB_HOST="mongodb://192.168.10.150:27017/posts"' >> .bashrc -y
rm -rf /etc/mongod.conf - cp mongod.conf /etc/mongod.conf