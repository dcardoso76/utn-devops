# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/bionic64"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.hostname = "utn-devops.localhost"
  config.vm.boot_timeout = 3600
  config.vm.provider "virtualbox" do |v|
	v.name = "utn-devops-vagrant-ubuntu"
  end

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "file", source: "devops.site.conf", destination: "/tmp/devops.site.conf"
  config.vm.provision :shell, path: "vagrant.provision.sh", run: "always"


end
