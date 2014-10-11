# disable selinux

execute 'setenforce 0' do
  only_if 'getenforce |grep -i Enforcing'
end

template '/etc/selinux/config' do
  source './templates/selinux_config.erb'
end
