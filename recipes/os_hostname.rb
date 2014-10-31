# OS hostname

execute "hostname #{node[:os][:hostname]}" do
  not_if "grep \"#{node[:os][:hostname]}\" /etc/sysconfig/network|awk -F'=' '{print $2}'"
  not_if "hostname --fqdn|grep ^#{node[:os][:hostname]}$"
  command "hostname #{node[:os][:hostname]}"
  command "sed -i \"s|HOSTNAME=.*|HOSTNAME=#{node[:os][:hostname]}|\" /etc/sysconfig/network"
end

template '/etc/hosts' do
  source './templates/hosts.erb'
end
