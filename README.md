Vagrant.configure("2") do |config|

  `config.vm.box = "ubuntu/xenial64"`
 
 #creating a virtual machine ubuntu 
  
  `config.vm.network "forwarded_port", guest: 3000, host: 8081`
  
  #config.vm.network "private_network", ip: "192.168.10.100"
  
  `config.vm.synced_folder ".", "/home/vagrant/starter-code/app"`
  
  #vagrant reload if doesnt work:
  #vagrant destroy
  #vagrant up
  
#provisisioning
  
  `config.vm.provision "shell", path: "provision.sh"`
end
