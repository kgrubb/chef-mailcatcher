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
when 'debian'
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
when 'debian'
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
when 'rhel', 'fedora', 'suse'
  template '/etc/init.d/mailcatcher' do
    source 'mailcatcher.init.conf.erb'
    mode 0744
    notifies :restart, 'service[mailcatcher]', :immediately
  end
  service 'mailcatcher' do
    provider Chef::Provider::Service::Init
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
