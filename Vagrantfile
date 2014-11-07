Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu1404"

  config.vm.define :spooler do |spooler|
    spooler.vm.hostname = 'spooler'
    spooler.vm.provision "shell", privileged: false, path: "scripts/provision-cups.sh"
    spooler.vm.network :private_network, ip: "192.168.33.2"
  end

  config.vm.define :client do |client|
    client.vm.hostname = 'client'
    client.vm.provision "shell", privileged: false, path: "scripts/provision-client.sh"
    client.vm.network :private_network, ip: "192.168.33.3"
  end

end
