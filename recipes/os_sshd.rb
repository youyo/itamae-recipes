# OS sshd

execute 'service sshd restart' do
  action :nothing
end

template '/etc/ssh/sshd_config' do
  source './templates/sshd_config.erb'
  notifies :run, "execute[service sshd restart]"
end

service 'sshd' do
  action [:start, :enable]
end
