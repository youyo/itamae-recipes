# Resource definition of common

define :install_and_enable_package, version: nil do
  package params[:name] do
    version parames[:version] if parames[:version]
    action :install
  end
  service params[:name] do
    action :enable
  end
end

define :install_and_enable_and_start_package, version: nil do
  package params[:name] do
    version parames[:version] if parames[:version]
    action :install
  end
  service params[:name] do
    action [:enable,:start]
  end
end
