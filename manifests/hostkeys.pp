class ssh::hostkeys {
  @@sshkey { $fqdn:
    type => rsa,
    key  => $sshrsakey,
  }

  Sshkey <<| |>> { ensure => present, }

  # Work around Puppet bug 2014
  # http://projects.puppetlabs.com/issues/2014
  file { '/etc/ssh/ssh_known_hosts':
    ensure => present,
    mode => 0644,
  }
}
