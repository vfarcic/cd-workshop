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
  config.vm.define :mesosmaster1 do |mesosmaster1|
    mesosmaster1.vm.network :forwarded_port, host: 5051, guest: 5050
    mesosmaster1.vm.provision "shell", path: "bootstrap_mesos.sh"
    mesosmaster1.vm.provision "shell", path: "bootstrap_mesos_master.sh", args: "1"
    mesosmaster1.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
    mesosmaster1.vm.network "private_network", ip: "192.168.50.71"
    mesosmaster1.vm.hostname = "mesosmaster1"
  end
  config.vm.define :mesosmaster2 do |mesosmaster2|
    mesosmaster2.vm.network :forwarded_port, host: 5052, guest: 5050
    mesosmaster2.vm.provision "shell", path: "bootstrap_mesos.sh"
    mesosmaster2.vm.provision "shell", path: "bootstrap_mesos_master.sh", args: "2"
    mesosmaster2.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
    mesosmaster2.vm.network "private_network", ip: "192.168.50.72"
    mesosmaster2.vm.hostname = "mesosmaster2"
  end
  config.vm.define :mesosmaster3 do |mesosmaster3|
    mesosmaster3.vm.network :forwarded_port, host: 5053, guest: 5050
    mesosmaster3.vm.provision "shell", path: "bootstrap_mesos.sh"
    mesosmaster3.vm.provision "shell", path: "bootstrap_mesos_master.sh", args: "3"
    mesosmaster3.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
    mesosmaster3.vm.network "private_network", ip: "192.168.50.73"
    mesosmaster3.vm.hostname = "mesosmaster3"
  end
  config.vm.define :mesosslave1 do |mesosslave1|
    mesosslave1.vm.provision "shell", path: "bootstrap_mesos.sh"
    mesosslave1.vm.provision "shell", path: "bootstrap_mesos_slave.sh"
    mesosslave1.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
    mesosslave1.vm.network "private_network", ip: "192.168.50.81"
    mesosslave1.vm.hostname = "mesosslave1"
  end
  config.vm.define :mesosslave2 do |mesosslave2|
    mesosslave2.vm.provision "shell", path: "bootstrap_mesos.sh"
    mesosslave2.vm.provision "shell", path: "bootstrap_mesos_slave.sh"
    mesosslave2.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
    mesosslave2.vm.network "private_network", ip: "192.168.50.82"
    mesosslave2.vm.hostname = "mesosslave2"
  end
  config.vm.define :mesosslave3 do |mesosslave3|
    mesosslave3.vm.provision "shell", path: "bootstrap_mesos.sh"
    mesosslave3.vm.provision "shell", path: "bootstrap_mesos_slave.sh"
    mesosslave3.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
    mesosslave3.vm.network "private_network", ip: "192.168.50.83"
    mesosslave3.vm.hostname = "mesosslave3"
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end