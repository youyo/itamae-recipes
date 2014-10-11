# test role

include_recipe '../recipes/common_definition.rb'
include_recipe '../recipes/yum_common.rb'
include_recipe '../recipes/yum_zabbix.rb'
include_recipe '../recipes/yum_epel.rb'
include_recipe '../recipes/yum_remi.rb'
include_recipe '../recipes/yum_mysql.rb'
include_recipe '../recipes/yum_nginx.rb'
include_recipe '../recipes/yum_owncloud.rb'
include_recipe '../recipes/yum_cache_clean.rb'
include_recipe '../recipes/ntp.rb'
