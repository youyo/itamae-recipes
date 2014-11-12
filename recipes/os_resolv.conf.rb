# OS resolv.conf

execute 'echo "options single-request-reopen" > /etc/resolv.conf'
execute 'chmod 644 /etc/resolv.conf'

node[:os][:resolv].each do |ip|
  execute "echo \"nameserver\t#{ip}\" >> /etc/resolv.conf"
end

execute 'sed -i "s|^NM_CONTROLLED|#NM_CONTROLLED|g" /etc/sysconfig/network-scripts/ifcfg-*'
