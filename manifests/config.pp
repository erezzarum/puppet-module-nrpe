class nrpe::config (
  $config       = $nrpe::config,
  $include_dir  = $nrpe::include_dir,
  $purge        = $nrpe::purge,
  $recurse      = $nrpe::recurse,
) inherits nrpe {

  file { 'nrpe_include_dir':
    ensure  => directory,
    name    => $include_dir,
    purge   => $purge,
    recurse => $recurse,
  } ->
  file { 'nrpe_config':
    name    => $config,
    content => template('nrpe/nrpe.cfg.erb'),
  }

}