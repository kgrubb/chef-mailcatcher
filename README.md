Chef Mailcatcher Cookbook
===

This cookbook is an amalgamation of the mailcatcher cookbooks made by andruby and bryantebeek.
It installs a single configurable instance of mailcatcher and installs/configures postfix.

## Attributes

This cookbook contains the following attributes:

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['bin']</tt></td>
    <td>String</td>
    <td>The location of the MailCatcher binary file</td>
    <td><tt>mailcatcher</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['smtp-ip']</tt></td>
    <td>String</td>
    <td>The ip address of the smtp server</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['smtp-port']</tt></td>
    <td>Integer</td>
    <td>The port of the smtp server</td>
    <td><tt>1025</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['http-ip']</tt></td>
    <td>String</td>
    <td>The ip address of the http server</td>
    <td><tt>0.0.0.0</tt></td>
  </tr>
  <tr>
    <td><tt>['mailcatcher']['http-port']</tt></td>
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

### mailcatcher::default

Include `mailcatcher` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[mailcatcher::default]"
  ]
}
```

Supported Platforms
---
Tested Platforms:
* Ubuntu 12.04
* Ubuntu 14.04
* Centos 7.0

Let me know if any other platforms are compatible and I'll add them to the list.

License and Authors
---

Author:: SPINEN (<keli.grubb@spinen.com>)
