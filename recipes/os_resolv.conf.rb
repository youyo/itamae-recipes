# OS resolv.conf

file '/etc/resolv.conf' do
  action :delete
end

node[:os][:resolv].each do |ip|
  execute "echo \"nameserver\t#{ip}\" >> /etc/resolv.conf"
end

execute 'echo "options single-request-reopen" >> /etc/resolv.conf'

execute 'sed -i "s|^NM_CONTROLLED|#NM_CONTROLLED|g" /etc/sysconfig/network-scripts/ifcfg-*'
