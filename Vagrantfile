# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
  config.ssh.forward_agent = true
  config.vm.provision "shell", path: "scripts/init.sh"

  # configure zookeeper cluster
  (1..3).each do |i|
    config.vm.define "zookeeper#{i}" do |s|
      s.vm.hostname = "zookeeper#{i}"
      s.vm.network "public_network", use_dhcp_assigned_default_route: true
      s.vm.network "private_network", ip: "10.30.3.#{i+1}", netmask: "255.255.255.0", virtualbox__intnet: "servidors", drop_nat_interface_default_route: true
      s.vm.provision "shell", path: "scripts/zookeeper.sh", args:"#{i}", privileged: "false"
    end
  end

  # configure brokers
  (1..3).each do |i|
    config.vm.define "broker#{i}" do |s|
      s.vm.hostname = "broker#{i}"
      s.vm.network "private_network", ip: "10.30.3.#{4-i}0", netmask: "255.255.255.0", virtualbox__intnet: "servidors", drop_nat_interface_default_route: true
      s.vm.provision "shell", path: "scripts/broker.sh", args:"#{i}", privileged: "false"
    end
  end

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end
end

