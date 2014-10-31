# Resource definition of common

define :install_and_enable_package do
  pkg = params[:name]
  package pkg
  service pkg do
    action :enable
  end
end

define :install_and_enable_and_start_package do
  pkg = params[:name]
  package pkg
  service pkg do
    action [:enable,:start]
  end
end

define :disable_daemon do
  daemon  = params[:name]
  service daemon do
    action [:stop, :disable]
  end
end

define :disable_and_stop_package do
  pkg = params[:name]
  package pkg
  service pkg do
    action [:disable,:stop]
  end
end
