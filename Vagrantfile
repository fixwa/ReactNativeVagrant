# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "ReactNativeVagrant"
  config.vm.network "public_network", ip: "192.168.10.10"
  config.vm.network "forwarded_port", guest: 19000, host: 19000, protocol: "tcp"
  config.vm.network "forwarded_port", guest: 19000, host: 19000, protocol: "udp"
  config.ssh.forward_agent = true

  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, :inline => "echo -e '#{File.read("#{Dir.home}/.gitconfig")}' > '/home/vagrant/.gitconfig'"
  config.vm.provision :shell, :inline => "echo -e '#{File.read("#{Dir.home}/.ssh/id_rsa")}' > '/home/vagrant/.ssh/id_rsa'"

  config.vm.synced_folder "react-projects/", "/react-projects", create: true
    config.vm.provider "virtualbox" do |vb|
      vb.name = "ReactNativeVagrant"
      vb.gui = false
      vb.memory = "3584"
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--usb", "on"]
    end
end