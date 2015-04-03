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

default['mailcatcher']['bin'] = 'mailcatcher'
default['mailcatcher']['logfile'] = '/var/log/mailcatcher.log'

default['postfix']['hostname'] = 'localhost-vagrant'
default['postfix']['relayhost'] = '127.0.0.1:1025'
