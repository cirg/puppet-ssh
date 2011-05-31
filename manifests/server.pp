class ssh::server (
  $ports = [ '22' ]
) {
  package { 'openssh-server':
    ensure => installed,
  }

  service { 'ssh':
    ensure  => running,
    require => Package['openssh-server'],
  }

  file { '/etc/ssh/sshd_config':
    content => template('ssh/sshd_config.erb'),
    notify  => Service['ssh'],
    require => Package['openssh-server'],
  }
}
