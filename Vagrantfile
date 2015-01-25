# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Standard minimal Ubuntu box
  config.vm.box = "trusty64"
  config.vm.box_url = "https://github.com/kraksoft/vagrant-box-ubuntu/releases/download/14.04/ubuntu-14.04-amd64.box"

  config.vm.network :private_network, ip: "33.33.33.10"
    config.vm.network :forwarded_port, guest: 35729, host: 35729
    config.vm.network :forwarded_port, guest: 27017, host: 27017
    config.ssh.forward_agent = true

  nfs_setting = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root" , :nfs => nfs_setting, :mount_options => ['actimeo=2']

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end

  # Provision the VM
  config.vm.provision :shell, path: "provision.sh"

end
