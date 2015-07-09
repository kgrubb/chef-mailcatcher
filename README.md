Chef Mailcatcher Cookbook
===

Description
---

This cookbook is an amalgamation of the mailcatcher cookbooks made by andruby and bryantebeek.
It installs a single configurable instance of mailcatcher and installs/configures postfix.

Attributes
---

This cookbook contains the following attributes:

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['mailcatcher']['name']</tt></td>
    <td>String</td>
    <td>The name of the MailCatcher binary file</td>
    <td><tt>mailcatcher</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['mailcatcher']['bin']</tt></td>
    <td>String</td>
    <td>The location of the MailCatcher binary file</td>
    <td><tt>/usr/local/bin/mailcatcher</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['smtp_ip']</tt></td>
    <td>String</td>
    <td>The ip address of the smtp server</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['smtp_port']</tt></td>
    <td>Integer</td>
    <td>The port of the smtp server</td>
    <td><tt>1025</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['http_ip']</tt></td>
    <td>String</td>
    <td>The ip address of the http server</td>
    <td><tt>0.0.0.0</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['http_port']</tt></td>
    <td>Integer</td>
    <td>The port of the http server</td>
    <td><tt>1080</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['logfile']</tt></td>
    <td>string</td>
    <td>The location of the log file</td>
    <td><tt>/var/log/mailcatcher.log</tt></td>
  </tr>
    <tr>
    <td><tt>['postfix']['hostname']</tt></td>
    <td>string</td>
    <td>The default hostname</td>
    <td><tt>localhost-vagrant</tt></td>
  </tr>
    <tr>
    <td><tt>['postfix']['relayhost']</tt></td>
    <td>string</td>
    <td>The relay host address</td>
    <td><tt>127.0.0.1:1025</tt></td>
  </tr>
</table>

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
