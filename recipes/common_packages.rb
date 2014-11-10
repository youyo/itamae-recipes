# common packages

%w(
  wget bash-completion screen sysstat vim-enhanced
  dstat openssh-server git libtool nc
).each do |pkg|
  package pkg
end
