# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', 16384,
                  '--cpus', 6, '--ioapic', 'on']
  end
  # ---------------------------------------------------------------------------
  # Global properties
  # ---------------------------------------------------------------------------
  config.vm.box = "MikeMorrow/centos.7.2"
  # config.vm.box  = "ubuntu/trusty64"
  # config.vm.box  = "ubuntu/vivid64"
  # ---------------------------------------------------------------------------
  # Devstack
  # ---------------------------------------------------------------------------

  config.vm.define :openServer do |openServer|
    openServer.vm.network :private_network, ip: "192.168.3.50"
    openServer.vm.hostname = 'openserver'
    openServer.vm.provision "shell", path: "scripts/setupEnvironment.sh"
    openServer.vm.provision "shell", path: "scripts/installOpenstack.sh"
  end
end
