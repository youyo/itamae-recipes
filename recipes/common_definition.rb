# Resource definition of common

define :install_and_enable_package do
  package params[:name]
  service params[:name] do
    action :enable
  end
end

define :install_and_enable_and_start_package do
  package params[:name]
  service params[:name] do
    action [:enable,:start]
  end
end
