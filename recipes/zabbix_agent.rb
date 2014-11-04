# zabbix agent

%w(zabbix-agent zabbix-sender zabbix-get).each {|pkg| package pkg}

directory '/var/lib/zabbix'
execute 'chown zabbix: /var/lib/zabbix'
execute 'chmod 700 /var/lib/zabbix'

template '/etc/zabbix/zabbix_agentd.conf' do
  source './templates/zabbix_agentd.conf.erb'
end

service 'zabbix-agent' do
  action [:start, :enable]
end
