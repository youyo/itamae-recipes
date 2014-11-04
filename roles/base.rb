# base role

include_recipe '../recipes/common_definition.rb'
include_recipe '../recipes/yum_common.rb'
include_recipe '../recipes/yum_zabbix.rb'
include_recipe '../recipes/yum_epel.rb'
include_recipe '../recipes/yum_cache_clean.rb'
include_recipe '../recipes/common_packages.rb'
include_recipe '../recipes/ntp.rb'
include_recipe '../recipes/disable_daemon.rb'
include_recipe '../recipes/disable_selinux.rb'
include_recipe '../recipes/disable_iptables.rb'
include_recipe '../recipes/os_update.rb'
include_recipe '../recipes/os_hostname.rb'
include_recipe '../recipes/os_resolv.conf.rb'
include_recipe '../recipes/os_user.rb'
include_recipe '../recipes/zabbix_agent.rb'
include_recipe '../recipes/os_clear_history.rb'
include_recipe '../recipes/os_reboot.rb'
