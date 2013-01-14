# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box     = "centos-6.2-x86_x64-minimal"
  config.vm.box_url = "https://dl.dropbox.com/u/219714/vagrant-boxes/centos-6.2-x86_x64-minimal.box"

  config.vm.define :server1 do |config|
    config.vm.host_name = "server1.vagrant"
    config.vm.network :hostonly, "192.168.192.2"
  end

  config.vm.define :server2 do |config|
    config.vm.host_name = "server2.vagrant"
    config.vm.network :hostonly, "192.168.192.3"
  end

end

