# OS resolv.conf

template '/etc/resolv.conf' do
  source './templates/resolv.conf.erb'
end

execute 'sed -i "s|^NM_CONTROLLED|#NM_CONTROLLED|g" /etc/sysconfig/network-scripts/ifcfg-*'
