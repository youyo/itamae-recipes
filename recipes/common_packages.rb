# common packages

%w(
  wget bash-completion screen sysstat vim-enhanced
  dstat openssh-server git libtool
).each do |pkg|
  package pkg
end
