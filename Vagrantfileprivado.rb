# -- mode: ruby --
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.define "Serverpython" do |Serverpython|
        Serverpython.vm.box = "manhattanprep/passenger-ruby-python-node"
        Serverpython.vm.network "private_network", ip: "10.0.0.14"
        Serverpython.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
            vb.cpus = 2
        end
        Serverpython.vm.provision "shell", inline: "sudo apt update && sudo pip install fastapi"
    end
    config.vm.define "serverelastic" do |serverelastic|
        serverelastic.vm.box = "michaelward82/trusty64-php7"
        serverelastic.vm.network "private_network", ip: "10.0.0.15"
        serverelastic.vm.provider "virtualbox" do |vb|
            vb.memory = "2048"
            vb.cpus = 2
        end
    end
end