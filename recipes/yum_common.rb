# yum_common

package 'yum-utils'

define :disable_repo do
  repo_name = params[:name]
  execute "disable_repo #{repo_name}" do
    command "yum-config-manager --disable #{repo_name}"
  end
end
