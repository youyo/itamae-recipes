# common packages

%w(
  wget bash-completion vim screen sysstat 
  dstat openssh-server git libtool
).each do |pkg|
  package pkg
end
