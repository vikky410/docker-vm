# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

Vagrant.configure("2") do |config|
config.vm.synced_folder "c:/temp", "/host_temp"
config.vm.define "my-little-container" do |m|
  m.vm.provider :docker do |d|
    d.volumes = ["/host_data/:/dock_host_data"]
    d.volumes = ["/share_x/:/dock_host", "/host_data/:/dock_host_data"]
    d.name = 'my-little-container'
    d.build_dir = "."
    d.cmd = ["ping", "-c 51", "127.0.0.1"]
    d.remains_running = true
    d.vagrant_machine = "dockerhostvm"
    d.vagrant_vagrantfile = "./DockerHostVagrantfile"
    d.cmd = ["/usr/sbin/apache2ctl","-D", "FOREGROUND"]
    d.ports = ["8080:80"]
   end
  end

config.vm.define "my-tiny-container" do |m|
  m.vm.provider :docker do |d|
    d.build_dir = "tiny-docker"
    d.name = 'my-tiny-container'
    d.vagrant_machine = "dockerhostvm"
    d.vagrant_vagrantfile = "./DockerHostVagrantfile"
    d.remains_running = true
    d.link("my-little-container:my-friend")
    d.cmd = ["ping", "-c 51", "127.0.0.1"]
    end
  end
end
