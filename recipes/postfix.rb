#
# Cookbook Name:: chef-mailcatcher
# Recipe:: postfix
#

# Install, configure, and restart postfix
package 'postfix'

service 'postfix' do
  supports restart: true, start: true, stop: true, status: true
  action :nothing
end

template '/etc/postfix/main.cf' do
  source 'postfix.main.cf.erb'
  owner 'root'
  group 'root'
  mode 0777
  notifies :restart, 'service[postfix]', :immediately
end
