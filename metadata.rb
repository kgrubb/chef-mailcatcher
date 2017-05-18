name             'chef-mailcatcher'
maintainer       'Keli Grubb'
maintainer_email 'keligrubb324@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures mailcatcher'
long_description 'Installs/Configures mailcatcher'
version          '0.2.1'
issues_url       'https://github.com/kgrubb/chef-mailcatcher/issues' if respond_to?(:issues_url)
source_url       'https://github.com/kgrubb/chef-mailcatcher' if respond_to?(:source_url)
chef_version     '>= 12.0' if respond_to?(:chef_version)

recipe 'chef-mailcatcher', 'Installs a single configurable instance of mailcatcher and installs/configures postfix.'

supports 'redhat'
supports 'centos'
supports 'suse'
supports 'ubuntu'
supports 'debian'
