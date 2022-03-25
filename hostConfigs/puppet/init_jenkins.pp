class jenkins {

    $bin_paths = '/usr/bin:/usr/sbin:/bin'

    # get key
    exec { 'install_jenkins_key':
        command => '/usr/bin/wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -',
    }

    # source file
    file { '/etc/apt/sources.list.d/jenkins.list':
        content => "deb https://pkg.jenkins.io/debian-stable binary/\n",
        ensure  => present,
        mode    => '0644',
        owner   => root,
        group   => root,
        require => Exec['install_jenkins_key'],
    } -> #ordeno la secuencia de pasos en el tiempo mediante el operador "->".
    # se utiliza para encadenar semanticamente distintas declaraciones

    # update
    exec { 'apt-get update':
        path    => $bin_paths,
        command => 'apt-get update',
    }

    # install jenkins
    $enhancers = [ 'openjdk-11-jre', 'jenkins' ]

    package { $enhancers:
        ensure => 'installed',
    } ->

    # Reemplazo el puerto de jenkins para que este escuchando en el 8082
    exec { 'replace_jenkins_port':
        path    => $bin_paths,
        command => "sed -i -- 's/HTTP_PORT=8080/HTTP_PORT=8082/g' /etc/default/jenkins",
        unless  => 'grep HTTP_PORT=8082 /etc/default/jenkins 2>/dev/null',
        notify  => Service['jenkins'],
    }

    # Reemplazo el puerto de jenkins para que este escuchando en el 8082
    exec { 'replace_jenkins_port_service':
        path    => $bin_paths,
        command => "sed -i -- 's/JENKINS_PORT=8080/JENKINS_PORT=8082/g' /lib/systemd/system/jenkins.service",
        unless  => 'grep JENKINS_PORT=8082 /lib/systemd/system/jenkins.service 2>/dev/null',
        notify  => Service['jenkins'],
    }

    # Notifico al gestor de servicios que un archivo cambio
    exec { 'reload-systemctl':
        path    => $bin_paths,
        command => 'systemctl daemon-reload',
    }

    # aseguro que el servicio de jenkins este activo
    service { 'jenkins':
        ensure  => running,
        enable  => "true",
        require => Exec['reload-systemctl']
    }
}
