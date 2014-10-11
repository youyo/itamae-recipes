# yum_repo nginx

rpm_package_from_url 'http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm' do
  repo'nginx'
end
