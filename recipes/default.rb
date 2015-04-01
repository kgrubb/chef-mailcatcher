#
# Cookbook Name:: mailcatcher
# Recipe:: default
#
# Copyright (C) 2015 SPINEN
#
# All rights reserved - Do Not Redistribute
#

# Install required dependencies
case node['platform_family']
when 'debian', 'ubuntu'
  %w(
    build-essential
    software-properties-common
    sqlite
    libsqlite3-dev
    make
    ruby1.9.1-dev
    g++
  ).each do |deb|
    package deb
  end
when 'rhel', 'fedora', 'suse'
  # Install required dependencies
  %w(
    gcc
    gcc-c++
    sqlite-devel
    ruby-devel
  ).each do |yum|
    package yum
  end
end

# Install mailcatcher
gem_package 'mailcatcher'

# Create init scripts for Mailcatcher daemon.
case node['platform_family']
# upstart script for ubuntu machines
when 'ubuntu'
  template '/etc/init/mailcatcher.conf' do
    source 'mailcatcher.upstart.conf.erb'
    mode 0644
    notifies :restart, 'service[mailcatcher]', :immediately
  end
  service 'mailcatcher' do
    provider Chef::Provider::Service::Upstart
    supports restart: true
    action :start
  end
# sysv script for debian
when 'debian'
  template '/etc/init.d/mailcatcher' do
    source 'mailcatcher.init.debian.conf.erb'
    mode 0744
    notifies :start, 'service[mailcatcher]', :immediately
  end
  service 'mailcatcher' do
    provider Chef::Provider::Service::Init
    supports start: true, stop: true, status: true
    action :start
  end
# sysv script for centos and suse (needs to be tested on suse still)
when 'suse', 'centos'
  template '/etc/init.d/mailcatcher' do
    source 'mailcatcher.init.redhat.conf.erb'
    mode 0744
    notifies :restart, 'service[mailcatcher]', :immediately
  end
  service 'mailcatcher' do
    provider Chef::Provider::Service::Init
    supports start: true, stop: true, status: true
    action :start
  end
# Systemd init scripts. Still broken.
when 'fedora'
  template '/usr/lib/systemd/system/mailcatcher.service' do
    source 'mailcatcher.init.systemd.conf.erb'
    mode 0644
    notifies :restart, 'service[mailcatcher]', :immediately
  end
  service 'mailcatcher' do
    provider Chef::Provider::Service::Systemd
    supports restart: true
    action :start
  end
end

# Install, configure, and restart postfix
package 'postfix'

template '/etc/postfix/main.cf' do
  source 'postfix.main.cf.erb'
  owner 'root'
  group 'root'
  mode 0777
end

service 'postfix' do
  action :restart
end
