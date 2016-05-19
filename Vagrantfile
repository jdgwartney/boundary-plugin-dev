# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  #
  # Centos
  #
  config.vm.define "centos-5.5" do |v|
    v.vm.box = "hansode/centos-5.5-x86_64"
    v.vm.hostname = "centos-5-5"
  end

  config.vm.define "centos-5.8" do |v|
    v.vm.box = "altenwald/centos-5.8-puppet"
    v.vm.hostname = "centos-5.8"
  end

  config.vm.define "centos-5.11" do |v|
    v.vm.box = "puppetlabs/centos-5.11-64-puppet"
    v.vm.hostname = "centos-5.11"
  end

  config.vm.define "centos-6.6" do |v|
    v.vm.box = "puppetlabs/centos-6.6-64-puppet"
    v.vm.hostname = "centos-6.6"
  end

  config.vm.define "centos-7.0" do |v|
    v.vm.box = "puppetlabs/centos-7.0-64-puppet"
    v.vm.hostname = "centos-7.0"
  end

  config.vm.define "centos-7.1", autostart: false do |v|
    v.vm.box = "puppetlabs/centos-7.1-64-puppet"
    v.vm.hostname = "centos-7.1"
  end

  config.vm.define "centos-7.2", autostart: false do |v|
    v.vm.box = "puppetlabs/centos-7.2-64-puppet"
    v.vm.hostname = "centos-7.2"
  end

  #
  # Debian
  #
  config.vm.define "debian-7.6" do |v|
    v.vm.box = "chef/debian-7.6"
    v.vm.hostname = "plugin-dev-debian-7.6"
  end

  #
  # RedHat
  #
  config.vm.define "fedora-19" do |v|
    v.vm.box = "chef/fedora-19"
    v.vm.hostname = "fedora-19"
  end

  config.vm.define "fedora-20" do |v|
    v.vm.box = "chef/fedora-20"
    v.vm.hostname = "fedora-20"
  end

  #
  # Mac OS X
  #
  config.vm.define "osx-10.9" do |v|
    v.vm.box = "mac-osx-10.9"
    v.vm.hostname = "osx-10.9"
  end

  #
  # Ubuntu
  #
  config.vm.define "ubuntu-12.04" do |v|
    v.vm.box = "hashicorp/precise64"
    v.vm.hostname = "ubuntu-12.04"
  end

  config.vm.define "ubuntu-12.10" do |v|
    v.vm.box = "chef/ubuntu-12.10"
    v.vm.hostname = "ubuntu-12.10"
  end

  config.vm.define "ubuntu-14.04" do |v|
    v.vm.box = "ubuntu/trusty64"
    v.vm.hostname = "ubuntu-14.04"
  end

  #
  # Windows
  #
  config.vm.define "windows-7" do |v|
    v.vm.box = "win_7_x64_eng"
    # Name shortened due to limitation of Windows
    v.vm.hostname = "plugin-dev-win-7"
    v.vm.communicator = "winrm"
    v.vm.network "forwarded_port", guest: 3389, host: 3389
  end

  config.vm.define "windows-2012-standard" do |v|
    v.vm.box = "opentable/win-2012-standard-amd64-nocm"
    # Name shortened due to limitation of Windows
    v.vm.hostname = "win-2012"
    v.vm.communicator = "winrm"
    v.vm.network "forwarded_port", guest: 3389, host: 3389
  end

  #
  # Add the required puppet modules before provisioning is run by puppet
  #
  config.vm.provision :shell do |shell|
     shell.inline = "puppet module install puppetlabs-apt;
                     puppet module install puppetlabs-stdlib;
                     puppet module install boundary-boundary;
                     # touch /etc/puppet/hiera.yaml;
                     exit 0"
  end

  #
  # Use Puppet to provision the server and setup an elastic search cluster
  # on a single box
  #
  config.vm.provision "puppet" do |puppet|
    puppet.environment_path = "environments"
    puppet.environment = "dev"
    # puppet.options = "--verbose --debug"
    puppet.facter = {
      "api_token" => ENV["TSP_API_TOKEN"]
    }
  end
end
