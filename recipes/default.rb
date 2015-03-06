#
# Cookbook Name:: mailcatcher
# Recipe:: default
#
# Copyright (C) 2015 SPINEN
#
# All rights reserved - Do Not Redistribute
#

# temporary: just updating
execute 'update' do
  command 'sudo apt-get update'
end

# Install required dependencies
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

# Install mailcatcher
gem_package 'mailcatcher'

# Create init scripts for Mailcatcher daemon.
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
