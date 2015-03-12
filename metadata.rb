name             'chef-mailcatcher'
maintainer       'SPINEN'
maintainer_email 'keli.grubb@spinen.com'
license          'Apache License v2.0'
description      'Installs/Configures mailcatcher'
long_description 'Installs/Configures mailcatcher'
version          '0.1.3'

recipe "chef-mailcatcher", "Installs a single configurable instance of mailcatcher and installs/configures postfix."

supports 'ubuntu', '=12.04'
supports 'ubuntu', '=14.04'
supports 'centos', '=7.0'