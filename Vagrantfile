# -*- mode: ruby -*-
# vi: set ft=ruby :

# constraint variables
VAGRANT_API_VERSION = "2"
UPDATE_CHANNEL = "alpha"

# setting variables for node
$master_vm_memory = 2048
$master_vm_cpus = 2

$worker_node_num = 1
$worker_vm_memory = 2048
$worker_vm_cpus = 2

Vagrant.require_version ">= 1.6.0"

# Make sure the vagrant-ignition plugin is installed
required_plugins = %w(vagrant-ignition)

Vagrant.configure(VAGRANT_API_VERSION) do |config|

  config.ssh.insert_key = false
  config.ssh.forward_agent = true

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

  # for master node setting
  config.vm.define :master001 do |v|
    ip = "172.16.1.170"
    hostname = "master001"

    v.vm.network "forwarded_port", guest:8080, host: 8080
    v.vm.network "forwarded_port", guest:8091, host: 8091
    v.vm.network "forwarded_port", guest:8443, host: 8443
    v.vm.network "private_network", ip: ip

    v.ignition.ip = ip
    v.ignition.hostname = hostname
    v.ignition.drive_name = hostname

    v.vm.provider :virtualbox do |vb|
      vb.memory = $master_vm_memory
      vb.cpus = $master_vm_cpus
    end

    v.vm.provision :shell, run: "always", path: "bin/master/run-rancher.sh"
  end

  # for worker node setting
  (1..$worker_node_num).each do |i|
    config.vm.define "worker#{'%03d' % i}" do |v|
      hostname = "worker#{'%03d' % i}"
      ip = "172.16.1.#{170 + i}"

      v.vm.network "forwarded_port", guest: 80,  host: "#{9000 + i}"
      #v.vm.network "forwarded_port", guest: 443, host: 443

      v.vm.hostname = hostname
      v.vm.network "private_network", ip: ip

      v.ignition.ip = ip
      v.ignition.hostname = hostname
      v.ignition.drive_name = hostname

      v.vm.provider :virtualbox do |vb|
        vb.memory = $worker_vm_memory
        vb.cpus = $worker_vm_cpus
      end
    end
  end

end
