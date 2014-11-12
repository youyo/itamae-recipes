# os user

define :set_sudo do
  username = params[:name]
  execute "set_sudo #{username}" do
    not_if "test -e /etc/sudoers.d/#{username}"
    command "
      echo -e \"#{username}\tALL=(ALL)\tALL\" > /etc/sudoers.d/#{username}
      chmod 440 /etc/sudoers.d/#{username}
    "
  end
end

node[:os][:user].each do |userdata|

  user userdata[0] do
    action :create
    home userdata[2]
  end

  execute "set_passwd #{userdata[0]}" do
    command "echo '#{userdata[0]}:#{userdata[1]}'|chpasswd"
  end

  set_sudo userdata[0] if userdata[3]

  case userdata.size
  when 5
    case userdata[4]["generate"]
    when true
      execute "create ssh key #{userdata[0]}" do
        not_if "test -e #{userdata[2]}/.ssh/id_rsa"
        command "
          su - #{userdata[0]} -c \"ssh-keygen -q -t rsa -N '#{userdata[4]["keypass"]}' -C '' -f #{userdata[2]}/.ssh/id_rsa\"
          su - #{userdata[0]} -c \"cat #{userdata[2]}/.ssh/id_rsa.pub > #{userdata[2]}/.ssh/authorized_keys\"
          su - #{userdata[0]} -c \"chmod 600 #{userdata[2]}/.ssh/authorized_keys\"
        "
      end
    when false
      directory "#{userdata[2]}/.ssh"
      execute "set_publickey #{userdata[0]}" do
        not_if "grep -q '#{userdata[4]["publickey"]}' #{userdata[2]}/.ssh/authorized_keys"
        command "
          echo '#{userdata[4]["publickey"]}' >> #{userdata[2]}/.ssh/authorized_keys
          chmod 700 #{userdata[2]}/.ssh
          chmod 600 #{userdata[2]}/.ssh/authorized_keys
          chown -R #{userdata[0]}: #{userdata[2]}/.ssh
        "
      end
    end
  end
end
