class apache {
    group { 'puppet':
        ensure => present,
    }

    exec { 'apt-get update --assume-yes':
        alias => 'aptupdate',
        path  => '/usr/bin',
        user  => 'root'
    }

    user { 'vagrant':
        groups => [
            'sudo'
        ]
    }

    package { 'apache2':
        ensure  => present,
        require => Exec['aptupdate'],
    }

    service { 'apache2':
        ensure  => running,
        require => Package['apache2'],
    }
}

class {'apache':}
