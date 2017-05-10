#
# Cookbook Name:: chef-mailcatcher
# Recipe:: default
#
# Copyright (C) 2015 SPINEN
#

# Install required dependencies
case node['platform_family']
when 'debian', 'ubuntu'
  %w(
    build-essential
    libsqlite3-dev
    ruby
    ruby-dev
  ).each do |deb|
    package deb
  end
when 'rhel', 'fedora'
  # Install required dependencies
  %w(
    gcc
    gcc-c++
    sqlite-devel
    ruby
    rubygems
    ruby-devel
  ).each do |yum|
    package yum
  end
when 'suse'
  # Install required dependencies
  %w(
    gcc
    gcc-c++
    make
    sqlite3-devel
    ruby
    ruby-devel
  ).each do |yum|
    package yum
  end
end

if node['platform'] == 'ubuntu' && node['platform_version'].to_f < 15.04
  # Install mailcatcher ruby 1.9
  gem_package 'mime-types' do
    version '< 3'
  end
  gem_package 'mailcatcher' do
    version node['mailcatcher']['version'] if node['mailcatcher']['version']
    options '--conservative'
    ignore_failure true
  end
  # upstart init script for ubuntu
  template '/etc/init/mailcatcher.conf' do
    source 'mailcatcher.upstart.conf.erb'
    mode 0644
    notifies :restart, 'service[mailcatcher]', :immediately
  end
  service 'mailcatcher' do
    provider Chef::Provider::Service::Upstart
    supports restart: true
    action [:enable, :start]
  end
elsif node['platform'] == 'debian' && node['platform_version'].to_f < 8.0
  # Install mailcatcher ruby 1.9
  gem_package 'mime-types' do
    version '< 3'
  end
  gem_package 'mailcatcher' do
    version node['mailcatcher']['version'] if node['mailcatcher']['version']
    options '--conservative'
    ignore_failure true
  end
  # sysv init script for debian
  template '/etc/init.d/mailcatcher' do
    source 'mailcatcher.init.debian.conf.erb'
    mode 0744
    notifies :start, 'service[mailcatcher]', :immediately
  end
  service 'mailcatcher' do
    provider Chef::Provider::Service::Init
    supports start: true, stop: true, status: true
    action [:enable, :start]
  end
elsif (node['platform'] == 'rhel' && node['platform_version'].to_f < 7.0) ||
      (node['platform'] == 'centos' && node['platform_version'].to_f < 7.14) ||
      (node['platform'] == 'fedora' && node['platform_version'].to_f < 15.0) ||
      (node['platform'] == 'suse' && node['platform_version'].to_f < 12.2)
  # Install mailcatcher ruby 1.9
  gem_package 'mime-types' do
    version '< 3'
  end
  gem_package 'mailcatcher' do
    version node['mailcatcher']['version'] if node['mailcatcher']['version']
    options '--conservative'
    ignore_failure true
  end
  # sysv init script for rh based
  template '/etc/init.d/mailcatcher' do
    source 'mailcatcher.init.redhat.conf.erb'
    mode 0744
    notifies :restart, 'service[mailcatcher]', :immediately
  end
  service 'mailcatcher' do
    provider Chef::Provider::Service::Init
    supports start: true, stop: true, status: true
    action [:enable, :start]
  end
else
  # Install mailcatcher ruby > 2.0
  gem_package 'mailcatcher' do
    version node['mailcatcher']['version'] if node['mailcatcher']['version']
    package_name node['mailcatcher']['name']
  end
  # Systemd init scripts.
  template '/etc/systemd/system/mailcatcher.service' do
    source 'mailcatcher.init.systemd.conf.erb'
    mode 0644
    notifies :restart, 'service[mailcatcher]', :immediately
  end
  service 'mailcatcher' do
    provider Chef::Provider::Service::Systemd
    supports restart: true
    action [:enable, :start]
  end
end

include_recipe 'chef-mailcatcher::postfix' if node['mailcatcher']['use_postfix']
