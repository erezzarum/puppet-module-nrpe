class nrpe::install (
  $ensure         = $nrpe::package_ensure,
  $package_name   = $nrpe::package_name,
  $provider       = $nrpe::provider,
  $manage_package = $nrpe::manage_package,
) inherits nrpe {

  if $manage_package {
    package { $package_name:
      ensure   => $ensure,
      provider => $provider,
    }
  }

}