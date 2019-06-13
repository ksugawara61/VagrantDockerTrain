# -*- mode: ruby -*-
# vi: set ft=ruby :

# constraint variables
VAGRANT_API_VERSION = "2"
UPDATE_CHANNEL = "alpha"

# setting variables for instance
$worker_instance_num = 2
$vm_memory = 1024
$vm_cpus = 1

Vagrant.require_version ">= 1.6.0"

# Make sure the vagrant-ignition plugin is installed
required_plugins = %w(vagrant-ignition)

Vagrant.configure(VAGRANT_API_VERSION) do |config|

  config.ssh.insert_key = false
  config.ssh.forward_agent = true

  #config.vm.box = "centos/7"
  config.vm.box = "coreos-#{UPDATE_CHANNEL}"
  config.vm.box_url = "https://#{UPDATE_CHANNEL}.release.core-os.net/amd64-usr/current/coreos_production_vagrant_virtualbox.json"

  config.vm.provider :virtualbox do |v|
    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in CoreOS, so tell Vagrant that so it can be smarter.
    v.check_guest_additions = false
    v.functional_vboxsf     = false
    # enable ignition (this is always done on virtualbox as this is how the ssh key is added to the system)
    config.ignition.enabled = true
  end

  config.vm.provision :shell, path: "bin/setup.sh"

  # for leader instance setting
  config.vm.define :leader001 do |v|
    ip = "192.168.33.10"

    v.vm.network "forwarded_port", guest: 80,  host: 80
    v.vm.network "forwarded_port", guest: 443, host: 443
    v.vm.network "private_network", ip: ip

    v.ignition.ip = ip
    v.ignition.hostname = "leader001"
    v.ignition.drive_name = "leader001"

    v.vm.provider :virtualbox do |vb|
      vb.memory = $vm_memory
      vb.cpus = $vm_cpus
    end
  end

  # for worker instance setting
  (1..$worker_instance_num).each do |i|
    config.vm.define "worker#{'%03d' % i}" do |v|
      hostname = "worker#{'%03d' % i}"
      ip = "192.168.33.#{100 + i}"

      v.vm.hostname = hostname
      v.vm.network "private_network", ip: ip

      v.ignition.ip = ip
      v.ignition.hostname = hostname
      v.ignition.drive_name = hostname

      v.vm.provider :virtualbox do |vb|
        vb.memory = $vm_memory
        vb.cpus = $vm_cpus
      end
    end
  end

end
