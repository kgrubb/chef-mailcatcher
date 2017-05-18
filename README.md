# Chef Mailcatcher Cookbook

## Description

This cookbook is an amalgamation of the mailcatcher cookbooks made by andruby and bryantebeek.
It installs a single configurable instance of mailcatcher and installs/configures postfix.

## Attributes

This cookbook contains the following attributes:

| Key | Type | Description | Default |
|:----|:-----|:------------|:--------|
| ['mailcatcher']['version'] | String | The version of the MailCatcher gem to install | nil (defaults to latest version available) |
| ['mailcatcher']['mailcatcher']['name'] | String | The name of the MailCatcher binary file | mailcatcher |
| ['mailcatcher']['mailcatcher']['bin'] | String | The location of the MailCatcher binary file | /usr/local/bin/mailcatcher |
| ['mailcatcher']['smtp_ip'] | String | The ip address of the smtp server | 127.0.0.1 |
| ['mailcatcher']['smtp_port'] | Integer | The port of the smtp server | 1025 |
| ['mailcatcher']['http_ip'] | String | The ip address of the http server | 0.0.0.0 |
| ['mailcatcher']['http_port'] | Integer | The port of the http server | 1080 |
| ['mailcatcher']['logfile'] | String | The location of the log file | /var/log/mailcatcher.log |
| ['mailcatcher']['use_postfix'] | Boolean | Install postfix as mail relay | true |
| ['postfix']['hostname'] | String | The default hostname | localhost-vagrant |
| ['postfix']['relayhost'] | String | The relay host address | 127.0.0.1:1025 |

## Usage

### chef-mailcatcher::default

Include `chef-mailcatcher` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-mailcatcher::default]"
  ]
}
```

## Supported Platforms

Tested on:

* Ubuntu 14.04
* Ubuntu 16.04
* Debian 8.7
* Centos 7.3
* Suse Leap 42.2

Let me know if any other platforms are compatible and I'll add them to the list.

**WARNING**: For now, the systemd scripts are only lightly tested. If you are using a distro that is using systemd (ex. Fedora 21 or Ubuntu 15), use with caution, and please inform me if anything isn't working properly.

## License and Authors

Author: Keli Grubb (<keligrubb324@gmail.com>)

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
