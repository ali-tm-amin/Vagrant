### Installing MongoDB
* `sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5`
* `echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list`
* `sudo apt-get update`
* `sudo apt-get install -y mongodb-org`
* tart the MongoDB daemon and enable it to start on boot by typing: `sudo systemctl start mongod`
 `sudo systemctl enable mongod`
* To verify whether the installation has completed successfully, we will connect to the MongoDB database server using the mongo tool and print the connection status: `mongo --eval 'db.runCommand({ connectionStatus: 1 })'`
* `systemctl status mongod`

## Commands ##
* `vagrant ssh db`
* `sudo systemctl status mongod`
* exit the VM, then `cd /ect`
* `sudo nano mongod.conf`
* `sudo systemctl restart mongod`
* `sudo systemctl enable mongod`
* `sudo systemctl status mongod`
* Exit the DB and go back to the app 
* `vagrant ssh app`
* run `printenv DB_HOST` if it doesnt print it
* create it `export DB_HOST="mongodb://192.168.56.4:27017/posts"`

*  `npm start` `node seeds/seed.js`

* copy file to vm `"mongodb://192.168.10.150:27017/posts"`
* Eco `'export DB_HOST="mongodb://192.168.10.150:27017/posts"' >> .bashrc -y` in the app provision file
*