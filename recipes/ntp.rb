# ntp

install_and_enable_package 'ntpdate'
package 'ntp'

execute 'ntpdate ntp.nict.jp' do
  not_if 'service ntpd status'
  command 'ntpdate -d ntp.nict.jp'
end

service 'ntpd' do
  action [:start,:enable]
  subscribes :restart, "template[/etc/ntp.conf]"
end

template '/etc/ntp.conf' do
  source './templates/ntp.conf.erb'
end
