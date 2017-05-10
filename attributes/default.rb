#
# Cookbook Name:: mailcatcher
# Recipe:: default
#
# Copyright (C) 2015 SPINEN
#

default['mailcatcher']['http_ip'] = '0.0.0.0'
default['mailcatcher']['http_port'] = 1080

default['mailcatcher']['smtp_ip'] = '127.0.0.1'
default['mailcatcher']['smtp_port'] = 1025

default['mailcatcher']['name'] = 'mailcatcher'
default['mailcatcher']['bin'] = "/usr/local/bin/#{node['mailcatcher']['name']}"
default['mailcatcher']['susebin'] = '/usr/bin/mailcatcher.ruby2.1' # Dirty hack for dirty ruby mgmt in suse
default['mailcatcher']['logfile'] = '/var/log/mailcatcher.log'

default['mailcatcher']['use_postfix'] = true

default['postfix']['hostname'] = 'localhost-vagrant'
default['postfix']['relayhost'] = '127.0.0.1:1025'
