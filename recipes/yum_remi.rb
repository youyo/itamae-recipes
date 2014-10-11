# yum_repo remi

rpm_package_from_url 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm' do
  repo'remi'
end
disable_repo 'remi'
