# yum_repo epel

include_recipe './yum_common.rb'

package 'epel-release'
disable_repo 'epel'
yum_clean 'all'
