stage { 'pre': before  => Stage['main'] }
stage {'last': require => Stage['main'] }

class base {
    group { 'puppet':
        ensure => present,
    }

    exec { 'apt-get -y update':
        alias => 'aptupdate',
        path  => '/usr/bin',
        user  => 'root',
    }

    user { 'vagrant':
        groups => [
            'sudo'
        ]
    }
}

class {'base': stage => pre }
class {'php5':}
class {'apache2':}
class {'svn':}
class {'zf1': stage => last }
