### Installing MongoDB
* `sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5`
* `echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list`
* `sudo apt-get update`
* `sudo apt-get install -y mongodb-org`
* tart the MongoDB daemon and enable it to start on boot by typing: `sudo systemctl start mongod`
 `sudo systemctl enable mongod`
* To verify whether the installation has completed successfully, we will connect to the MongoDB database server using the mongo tool and print the connection status: `mongo --eval 'db.runCommand({ connectionStatus: 1 })'`
* `systemctl status mongod`