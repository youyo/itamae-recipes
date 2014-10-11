# yum_repo owncloud

template '/etc/yum.repos.d/owncloud.repo' do
  source './templates/owncloud.repo.erb'
end
