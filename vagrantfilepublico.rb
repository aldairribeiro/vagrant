# -- mode: ruby --
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.define "serverDns" do |serverDns|
        serverDns.vm.box = "ubuntu/trusty64"
        serverDns.vm.network "private_network", ip: "10.0.0.12"
        serverDns.vm.network "forwarded_port", guest: 80, host: 8080 
        serverDns.vm.network "public_network", ip: "192.168.33.10"
        serverDns.vm.provider "virtualbox" do |vb|
            vb.memory = "512"
            vb.cpus = 1
        end
        serverDns.vm.provision "shell", inline: "sudo apt update && sudo apt install nginx -y"
    end
    config.vm.define "serverNode" do |serverNode|
        serverNode.vm.box = "ubuntu/trusty64"
        serverNode.vm.network "private_network", ip: "10.0.0.13"
        serverNode.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
            vb.cpus = 1
        end
        serverNode.vm.provision "shell", inline: "sudo apt update && sudo apt install nodejs -y"

    end
   
end