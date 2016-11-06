# == Class: nrpe
#
# Full description of class nrpe here.
#
# === Parameters
#
# Document parameters here.
#
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# === Examples
#
#
# === Copyright
#
# Copyright 2013 Computer Action Team, unless otherwise noted.
#
class nrpe (
  $allowed_hosts                   = ['127.0.0.1'],
  $server_address                  = '0.0.0.0',
  $command_timeout                 = 60,
  $config                          = $nrpe::params::nrpe_config,
  $include_dir                     = $nrpe::params::nrpe_include_dir,
  $package_ensure                  = $nrpe::params::package_ensure,
  $package_name                    = $nrpe::params::nrpe_packages,
  $provider                        = $nrpe::params::nrpe_provider,
  $manage_package                  = $nrpe::params::manage_package,
  $purge                           = undef,
  $recurse                         = undef,
  $service_ensure                  = $nrpe::params::service_ensure,
  $service_enable                  = $nrpe::params::service_enable,
  $service_manage                  = $nrpe::params::service_manage,
  $service_name                    = $nrpe::params::nrpe_service,
  $dont_blame_nrpe                 = $nrpe::params::dont_blame_nrpe,
  $log_facility                    = $nrpe::params::log_facility,
  $server_port                     = $nrpe::params::server_port,
  $command_prefix                  = $nrpe::params::command_prefix,
  $debug                           = $nrpe::params::debug,
  $connection_timeout              = $nrpe::params::connection_timeout,
  $allow_bash_command_substitution = $nrpe::params::allow_bash_command_substitution,
  $nrpe_user                       = $nrpe::params::nrpe_user,
  $nrpe_group                      = $nrpe::params::nrpe_group,
  $nrpe_pid_file                   = $nrpe::params::nrpe_pid_file,
) inherits nrpe::params {

  include '::nrpe::install'
  include '::nrpe::config'
  include '::nrpe::service'

  anchor { 'nrpe::begin': }
  anchor { 'nrpe::end': }

  Anchor['nrpe::begin'] ->
  Class['::nrpe::install'] ->
  Class['::nrpe::config'] ~>
  Class['::nrpe::service'] ->
  Anchor['nrpe::end']

}
