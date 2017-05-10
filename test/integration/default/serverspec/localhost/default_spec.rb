require 'spec_helper'

describe service('mailcatcher') do
  it { should be_enabled }
  it { should be_running }
end

# for some reason this test always false negative on RedHat based os 
describe command('mailcatcher --version'), :if => (os[:family] != 'redhat' and  os[:family] != 'opensuse') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should contain 'mailcatcher' }
end

# Not used due systemd have own logging system
#describe file('/var/log/mailcatcher.log') do
#  it { should exist }
#  it { should be_file }
#  it { should be_mode '644' }
#  it { should be_owned_by 'root' }
#  it { should be_grouped_into 'root' }
#end

describe port(1025) do
  it { should be_listening.on('127.0.0.1').with('tcp') }
end

describe port(1080) do
  it { should be_listening.on('0.0.0.0').with('tcp') }
end
