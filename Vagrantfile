# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  config.vm.define :cd, primary: true do |cd|
    cd.vm.network :forwarded_port, host: 8080, guest: 8080
    cd.vm.network :forwarded_port, host: 5000, guest: 5000
    cd.vm.network :forwarded_port, host: 2201, guest: 22, id: "ssh", auto_correct: true
    cd.vm.network "private_network", ip: "192.168.50.91"
    cd.vm.provision "shell", path: "bootstrap.sh"
    cd.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/cd.yml -c local'
    cd.vm.hostname = "cd"
  end
  config.vm.define :prod do |prod|
    prod.vm.network :forwarded_port, host: 2202, guest: 22, id: "ssh", auto_correct: true
    prod.vm.network :forwarded_port, host: 9000, guest: 80
    prod.vm.network :forwarded_port, host: 9001, guest: 9001
    prod.vm.network :forwarded_port, host: 9002, guest: 9002
    prod.vm.network "private_network", ip: "192.168.50.92"
    prod.vm.hostname = "prod"
  end
  config.vm.define :swarmmaster, primary: true do |swarmmaster|
    swarmmaster.vm.network "private_network", ip: "192.168.50.80"
    swarmmaster.vm.hostname = "swarmmaster"
    swarmmaster.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end
  config.vm.define :swarmnode1, primary: true do |swarmnode1|
    swarmnode1.vm.network "private_network", ip: "192.168.50.81"
    swarmnode1.vm.hostname = "swarmnode1"
    swarmnode1.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end
  config.vm.define :swarmnode2, primary: true do |swarmnode2|
    swarmnode2.vm.network "private_network", ip: "192.168.50.82"
    swarmnode2.vm.hostname = "swarmnode2"
    swarmnode2.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end