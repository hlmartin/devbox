# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  ## Bento boxes are yummy.
  config.vm.box = "bento/ubuntu-16.04"

  ## Fixes issue with VB not allowing symlinks.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  ## Install puppet.
  config.vm.provision :shell,
    path: "https://raw.githubusercontent.com/petems/puppet-install-shell/master/install_puppet.sh"

  ## Install other deps using puppet.
  config.librarian_puppet.puppetfile_dir = "puppet"
  config.librarian_puppet.placeholder_filename = ".gitkeep"
  config.vm.provision :puppet do |puppet|
    #puppet.options = "--verbose --debug"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "puppet/modules"
    puppet.hiera_config_path = "puppet/hiera.yaml"
  end
end
