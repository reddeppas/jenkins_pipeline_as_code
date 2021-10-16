$script = <<-SCRIPT
#!/bin/bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get update
apt-get -y install openjdk-8-jdk
apt-get -y install curl


echo "Your nodeJs server is ready!"
SCRIPT
Vagrant.configure("2") do |config|
    config.vm.define 'linuxnode1', primary: false do |linuxnode1|
        linuxnode1.vm.box = "hashicorp/bionic64"
        linuxnode1.vm.network "forwarded_port", guest: 3000, host: 3000
        linuxnode1.vm.network :private_network, ip: '33.33.33.31', libvirt__forward_mode: 'route', libvirt__dhcp_enabled: false
        linuxnode1.vm.provision "shell", inline: $script
    end
end