# -*- mode: ruby -*-
# vi: set ft=ruby :

$update_channel = "alpha"

Vagrant.require_version ">= 1.6.0"

# Make sure the vagrant-ignition plugin is installed
required_plugins = %w(vagrant-ignition)

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false
  config.ssh.forward_agent = true

  #config.vm.box = "centos/7"
  config.vm.box = "coreos-#{$update_channel}"
  config.vm.box_url = "https://#{$update_channel}.release.core-os.net/amd64-usr/current/coreos_production_vagrant_virtualbox.json"

  config.vm.network "forwarded_port", guest: 80,  host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider :virtualbox do |v|
    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in CoreOS, so tell Vagrant that so it can be smarter.
    v.check_guest_additions = false
    v.functional_vboxsf     = false
    # enable ignition (this is always done on virtualbox as this is how the ssh key is added to the system)
    config.ignition.enabled = true
  end

end
