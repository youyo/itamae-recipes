# OS quota
# root-pertitionでusrquotaかけることを想定

package 'quota'

execute 'write fstab' do
  not_if "grep -q 'usrquota' /etc/fstab"
  command "sed -i \"/ \/ /s/ defaults / defaults,usrquota /\" /etc/fstab"
  command "mount -o rw,remount /"
end

execute 'quota check' do
  not_if "test -e /aquota.user"
  command "quotacheck -cvm /"
  command "quotaon -uv /"
end

# TODO
# user追加とquota設定
=begin
useradd -s /sbin/nologin -M --system quota0g
useradd -s /sbin/nologin -M --system quota8g
useradd -s /sbin/nologin -M --system quota18g
useradd -s /sbin/nologin -M --system quota28g
useradd -s /sbin/nologin -M --system quota38g
useradd -s /sbin/nologin -M --system quota48g
useradd -s /sbin/nologin -M --system quota58g
useradd -s /sbin/nologin -M --system quota68g
useradd -s /sbin/nologin -M --system quota78g
useradd -s /sbin/nologin -M --system quota88g
useradd -s /sbin/nologin -M --system quota98g

setquota -u quota0g 0 0 0 0 -a
setquota -u quota8g 8388608 8388608 0 0 -a
setquota -u quota18g 18874368 18874368 0 0 -a
setquota -u quota28g 29360128 29360128 0 0 -a
setquota -u quota38g 39845888 39845888 0 0 -a
setquota -u quota48g 50331648 50331648 0 0 -a
setquota -u quota58g 60817408 60817408 0 0 -a
setquota -u quota68g 71303168 71303168 0 0 -a
setquota -u quota78g 81788928 81788928 0 0 -a
setquota -u quota88g 92274688 92274688 0 0 -a
setquota -u quota98g 102760448 102760448 0 0 -a
=end
