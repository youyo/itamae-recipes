# yum update

execute 'OS update' do
  not_if "test -e /tmp/itamae_tmp/OS_UPDATE.txt"
  command 'yum update -y'
  command 'touch /tmp/itamae_tmp/OS_UPDATE.txt'
end
