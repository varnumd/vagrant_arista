# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
# -*- mode: ruby -*-
# vi: set ft=ruby :

veos = 'vEOS-lab-4.21.1.1F'

Vagrant.configure(2) do |config|
  config.vm.boot_timeout = 500
#  config.vm.provision "ansible" do |ansible|
#    ansible.playbook = "./scripts/empty_playbook.yml"
#    ansible.groups = {
#      "leaf" => ["leaf1","leaf3","leaf2","leaf5","leaf4","leaf6",],
#      "spine" => ["spine1","spine2",],
#      "host" => ["server4","server2","server3","server1","server6","server5",],
#      "network:children" => ["leaf","spine","edge",]
#    }
#  end

  config.vm.define 'spine1' do |spine1|
    spine1.vm.box = veos
    spine1.vm.network 'private_network', virtualbox__intnet: 'mgmt', auto_config: false
    spine1.vm.network 'private_network', virtualbox__intnet: 's1l1', auto_config: false
    spine1.vm.network 'private_network', virtualbox__intnet: 's1l2', auto_config: false
    spine1.vm.network 'private_network', virtualbox__intnet: 's1l3', auto_config: false
    spine1.vm.network 'private_network', virtualbox__intnet: 's1l4', auto_config: false
  spine1.vm.network "forwarded_port", guest: 22, host: 20522

    spine1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc6", "allow-vms"]
      end

    spine1.vm.provision "shell", inline: <<-SHELL
      sleep 30
      FastCli -p 15 -c "configure
      interface Ethernet1
        no switchport
        ip address 10.1.1.205/24
      ip routing
      end"
      SHELL

  end
  
  config.vm.define 'spine2' do |spine2|
    spine2.vm.box = veos
    spine2.vm.network 'private_network', virtualbox__intnet: 'mgmt', auto_config: false
    spine2.vm.network 'private_network', virtualbox__intnet: 's2l1', auto_config: false
    spine2.vm.network 'private_network', virtualbox__intnet: 's2l2', auto_config: false
    spine2.vm.network 'private_network', virtualbox__intnet: 's2l3', auto_config: false
    spine2.vm.network 'private_network', virtualbox__intnet: 's2l4', auto_config: false
  spine2.vm.network "forwarded_port", guest: 22, host: 20622

    spine2.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc6", "allow-vms"]
      end

    spine2.vm.provision "shell", inline: <<-SHELL
      sleep 30
      FastCli -p 15 -c "configure
      interface Ethernet1
        no switchport
        ip address 10.1.1.206/24
      ip routing
      end"
      SHELL
  end
  
  config.vm.define 'leaf1' do |leaf1|
    leaf1.vm.box = veos
    leaf1.vm.network 'private_network', virtualbox__intnet: 'mgmt', auto_config: false
    leaf1.vm.network 'private_network', virtualbox__intnet: 's1l1', auto_config: false
    leaf1.vm.network 'private_network', virtualbox__intnet: 's2l1', auto_config: false
    leaf1.vm.network 'private_network', virtualbox__intnet: 'l1l2', auto_config: false
    leaf1.vm.network "forwarded_port", guest: 22, host: 20122

    leaf1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc6", "allow-vms"]
      end

    leaf1.vm.provision "shell", inline: <<-SHELL
      sleep 30
      FastCli -p 15 -c "configure
      interface Ethernet1
        no switchport
        ip address 10.1.1.201/24
      ip routing
      end"
      SHELL

  end

  config.vm.define 'leaf2' do |leaf2|
    leaf2.vm.box = veos
    leaf2.vm.network 'private_network', virtualbox__intnet: 'mgmt', auto_config: false
    leaf2.vm.network 'private_network', virtualbox__intnet: 's1l2', auto_config: false
    leaf2.vm.network 'private_network', virtualbox__intnet: 's2l2', auto_config: false
    leaf2.vm.network 'private_network', virtualbox__intnet: 'l1l2', auto_config: false
    leaf2.vm.network "forwarded_port", guest: 22, host: 20222

    leaf2.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      end
  
    leaf2.vm.provision "shell", inline: <<-SHELL
      sleep 10
      FastCli -p 15 -c "configure
      interface Ethernet1
        no switchport
        ip address 10.1.1.202/24
      ip routing
      end"
      SHELL

    end

  config.vm.define 'leaf3' do |leaf3|
    leaf3.vm.box = veos
    leaf3.vm.network 'private_network', virtualbox__intnet: 'mgmt', auto_config: false
    leaf3.vm.network 'private_network', virtualbox__intnet: 's1l3', auto_config: false
    leaf3.vm.network 'private_network', virtualbox__intnet: 's2l3', auto_config: false
    leaf3.vm.network 'private_network', virtualbox__intnet: 'l3l4', auto_config: false
    leaf3.vm.network "forwarded_port", guest: 22, host: 20322

    leaf3.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      end
  
    leaf3.vm.provision "shell", inline: <<-SHELL
      sleep 10
      FastCli -p 15 -c "configure
      interface Ethernet1
        no switchport
        ip address 10.1.1.203/24
      ip routing
      end"
      SHELL

    end

  config.vm.define 'leaf4' do |leaf4|
    leaf4.vm.box = veos
    leaf4.vm.network 'private_network', virtualbox__intnet: 'mgmt', auto_config: false
    leaf4.vm.network 'private_network', virtualbox__intnet: 's1l4', auto_config: false
    leaf4.vm.network 'private_network', virtualbox__intnet: 's2l4', auto_config: false
    leaf4.vm.network 'private_network', virtualbox__intnet: 'l3l4', auto_config: false
    leaf4.vm.network "forwarded_port", guest: 22, host: 20422

    leaf4.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc4", "allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc5", "allow-vms"]
      end
  
    leaf4.vm.provision "shell", inline: <<-SHELL
      sleep 10
      FastCli -p 15 -c "configure
      interface Ethernet1
        no switchport
        ip address 10.1.1.204/24
      ip routing
      end"
      SHELL

    end

  config.vm.define 'mgmt' do |mgmt|
    mgmt.vm.box = "ubuntu/trusty64"
    mgmt.vm.hostname = "mgmt"
    mgmt.vm.provision "shell", path: "scripts/mgmt.sh"
    mgmt.vm.network 'private_network', virtualbox__intnet: 'mgmt', ip: "10.1.1.10"

    mgmt.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "1024"]
      end
  end

end