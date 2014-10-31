# ntp

install_and_enable_package 'ntpdate'
package 'ntp'

execute 'restart ntpd' do
  action :nothing
  command 'sudo service ntpd restart >> /tmp/test.txt 2>&1'
end

execute 'ntpdate ntp.nict.jp' do
  not_if 'service ntpd status'
  command 'ntpdate -d ntp.nict.jp'
end

template '/etc/ntp.conf' do
  source './templates/ntp.conf.erb'
  notifies :run, "execute[restart ntpd]"
end

service 'ntpd' do
  action [:start,:enable]
end
