# yum_repo remi

rpm_package_from_url 'http://repo.zabbix.com/zabbix/2.2/rhel/6/x86_64/zabbix-release-2.2-1.el6.noarch.rpm' do
  repo'zabbix'
end
disable_repo 'zabbix'
