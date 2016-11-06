class nrpe::service (
  $ensure         = $nrpe::service_ensure,
  $service_enable = $nrpe::service_enable,
  $service_manage = $nrpe::service_manage,
  $service_name   = $nrpe::service_name,
) inherits nrpe {

  if $service_manage {
    service { $service_name:
      ensure => $ensure,
      enable => $service_enable,
    }
  }

}