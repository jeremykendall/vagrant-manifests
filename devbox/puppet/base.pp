class devbox {
    group { 'puppet':
        ensure => present,
    }

    exec { 'apt-get update --assume-yes':
        alias => 'aptupdate',
        path  => '/usr/bin',
        user  => 'root',
    }

    user { 'vagrant':
        groups => [
            'sudo'
        ]
    }

    exec { 'mkdir -p /var/sites/dev.devbox/public':
        path  => '/bin',
        alias => 'mkdevboxdir',
    }

    file { 'devbox-index':
        name    => '/var/sites/dev.devbox/public/index.php',
        ensure  => present,
        source  => 'puppet:////vagrant/puppet/dev.devbox/public/index.php',
        require => Exec['mkdevboxdir'],
    }

    apache2::vhost { 'devbox.dev':
        port            => 80,
        docroot         => '/var/sites/dev.devbox/public',
        configfile_name => 'dev.devbox',
    }

}

class {'devbox':}
class {'php5':}
class {'hosts':
    hosts => ['devbox.dev'],
    os    => 'ubuntu-11.10',
}
class {'apache2':}
