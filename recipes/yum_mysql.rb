# yum_repo mysql

rpm_package_from_url 'http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm' do
  repo "mysql56-community"
end
