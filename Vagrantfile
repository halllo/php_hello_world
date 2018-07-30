# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # Box Settings
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.define "php_hello_world"

  # Provider Settings
  config.vm.provider "hyperv" do |v|
    v.memory = "1024"
    v.cpus = 2
  end

  # Network Settings are ignored with hyperv :(
  #config.vm.network "private_network", ip: "192.168.33.10"

  # Folder Settings
  config.vm.synced_folder ".", "/var/www/html", type: "smb"

  # Provisions
  config.vm.provision "shell", path: "bootstrap.sh"
  
end
