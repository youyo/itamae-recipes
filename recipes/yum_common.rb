# yum_common

package 'yum-utils'

define :disable_repo do
  repo_name = params[:name]
  execute "disable_repo #{repo_name}" do
    only_if "yum repolist all|grep \"^#{repo_name} \"|awk '{print $(NF - 1)}'|grep -q 'enabled:'"
    command "yum-config-manager --disable #{repo_name}"
  end
end

define :yum_clean do
  type = params[:name]
  execute "yum clean #{type}"
end
