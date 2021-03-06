# yum_common

package 'yum-utils'

define :enable_repo do
  repo_name = params[:name]
  execute "enable_repo #{repo_name}" do
    command "yum-config-manager --enable #{repo_name}"
  end
end

define :disable_repo do
  repo_name = params[:name]
  execute "disable_repo #{repo_name}" do
    command "yum-config-manager --disable #{repo_name}"
  end
end

define :rpm_package_from_url, repo: nil do
  url = params[:name]
  repo_name = params[:repo]
  package url do
    only_if "test 0 -eq `yum-config-manager --showduplicates -q #{repo_name}|wc -l`"
    action :install
  end
end
