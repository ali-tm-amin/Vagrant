## Add environment variable permanently
`echo "export DB_HOST=192.168.10.150:27017" >> .bashrc -y`

## Creating Multi_VMs
    Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/xenial64"
    #config.vm.network "private_network", ip: "192.168.10.100"
    config.vm.provision "shell", path: "./provision.sh"
    config.vm.synced_folder ".", "/home/vagrant/app"

    config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.vm.provision "shell", path: "./provision_app.sh"
    end

    config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.vm.provision "shell", path: "./provision_db.sh"
    end

    config.vm.synced_folder ".", "/home/vagrant/app"
    #provisioning

    end

## Setting up Nginx as reverse proxy server

  - `sudo nano /etc/nginx/sites-available/default`
- Within the server block you should have an existing location / block. Replace the contents of that block with the following configuration. If your application is set to listen on a different port, update the highlighted portion to the correct port number.
 -     location / {
        proxy_pass http://localhost:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        }

## Setting up Mongodb

    #be careful of these keys, they will go out of date
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
    echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

    sudo apt-get update -y
    sudo apt-get upgrade -y

    # sudo apt-get install mongodb-org=3.2.20 -y
    sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20 --allow-downgrades

    # Mongod
    sudo cp mongod.conf /etc/mongod.conf

    # if mongo is is set up correctly these will be successful
    sudo systemctl restart mongod
    sudo systemctl enable mongod

- cd /etc
- `sudo nano mongod.conf`
change **bindIP** to 0.0.0.0 (accessable to all (not secure)) or to desired IP e.g. appIP so only it can access it
## Some commands ##
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
* create it by `export DB_HOST="mongodb://192.168.56.4:27017/posts"`

*  `npm start` `node seeds/seed.js`

* copy file to vm `"mongodb://192.168.10.150:27017/posts"`
* echo `'export DB_HOST="mongodb://192.168.10.150:27017/posts"' >> .bashrc -y` in the app provision file
