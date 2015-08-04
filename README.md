Chef Mailcatcher Cookbook
===

Description
---

This cookbook is an amalgamation of the mailcatcher cookbooks made by andruby and bryantebeek.
It installs a single configurable instance of mailcatcher and installs/configures postfix.

Attributes
---

This cookbook contains the following attributes:

|Key|Type|Description|Default|
|:---|:---|:---|:---|
|['mailcatcher']['version']|String|The version of the MailCatcher gem to install|nil (defaults to latest version available)|
|['mailcatcher']['mailcatcher']['name']|String|The name of the MailCatcher binary file|mailcatcher|
|['mailcatcher']['mailcatcher']['bin']|String|The location of the MailCatcher binary file|/usr/local/bin/mailcatcher|
|['mailcatcher']['smtp_ip']|String|The ip address of the smtp server|127.0.0.1|
|['mailcatcher']['smtp_port']|Integer|The port of the smtp server|1025|
|['mailcatcher']['http_ip']|String|The ip address of the http server|0.0.0.0|
|['mailcatcher']['http_port']|Integer|The port of the http server|1080|
|['mailcatcher']['logfile']|String|The location of the log file|/var/log/mailcatcher.log|
|['postfix']['hostname']|String|The default hostname|localhost-vagrant|
|['postfix']['relayhost']|String|The relay host address|127.0.0.1:1025|

Usage
---

### chef-mailcatcher::default

Include `chef-mailcatcher` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-mailcatcher::default]"
  ]
}
```

Supported Platforms
---

Tested Platforms:

* Ubuntu 12.04
* Ubuntu 14.04
* Debian 7.8
* Centos 7.0

Let me know if any other platforms are compatible and I'll add them to the list.

WARNING: For now, the systemd scripts are incomplete, so any distro using systemd will probably run into issues (ex. Fedora 21).

License and Authors
---

Author: SPINEN (<keligrubb324@gmail.com>)
