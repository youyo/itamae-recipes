# ntp

install_and_enable_package 'ntpdate'
package 'ntp'

execute 'ntpdate ntp.nict.jp' do
  not_if 'service ntpd status'
  command 'ntpdate -d ntp.nict.jp'
end

execute 'service ntpd restart' do
  action :nothing
end

template '/etc/ntp.conf' do
  source './templates/ntp.conf.erb'
  notifies :run, "execute[service ntpd restart]"
end

service 'ntpd' do
  action [:start,:enable]
end
