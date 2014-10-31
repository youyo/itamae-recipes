# KVM

%w(
  virt-manager tigervnc-server bridge-utils
  @base @development @virtualization @virtualization-client
  @virtualization-platform @virtualization-tools @x-window-system
  @desktop @japanese-support
).each do |pkg|
  package pkg
end

node[:kvm][:nic].each_with_index do |nic,index|
  execute "set_nic:#{nic[0]}" do
    command "
cat <<EOL> /etc/sysconfig/network-scripts/ifcfg-#{nic[0]}
DEVICE=#{nic[0]}
ONBOOT=yes
BRIDGE=br#{index}
BOOTPROTO='static'
EOL
    "
  end

  case nic.size
  when 4
    execute "set_bridge:br#{index}" do
      command "
cat <<EOL> /etc/sysconfig/network-scripts/ifcfg-br#{index}
BOOTPROTO=none
NETMASK=#{nic[2]}
ONBOOT=yes
DEVICE=br#{index}
IPADDR=#{nic[1]}
GATEWAY=#{nic[3]}
IPV6INIT=no
TYPE=Bridge
EOL
      "
    end
  when 3
    execute "set_bridge:br#{index}" do
      command "
cat <<EOL> /etc/sysconfig/network-scripts/ifcfg-br#{index}
BOOTPROTO=none
NETMASK=#{nic[2]}
ONBOOT=yes
DEVICE=br#{index}
IPADDR=#{nic[1]}
IPV6INIT=no
TYPE=Bridge
EOL
      "
    end
  end
end

template '/etc/init.d/vncserver' do
  source './templates/kvm_vncserver.erb'
end

execute 'chmod 755 /etc/init.d/vncserver' do
  
end

directory '/root/.vnc'
execute "echo '2up78djo0gu9'|vncpasswd -f > /root/.vnc/passwd" do
  not_if "test -e /root/.vnc/passwd"
end

execute 'sed -i "s|^id:3|id:5|" /etc/inittab' do
  only_if 'grep -q "^id:3" /etc/inittab'
end

%w(vncserver libvirtd).each do |svc|
  service svc do
    action :enable
  end
end
