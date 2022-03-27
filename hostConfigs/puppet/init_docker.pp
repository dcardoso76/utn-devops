class docker_install {

	$bin_paths = '/usr/bin:/usr/sbin:/bin'

	exec { 'docker-key':                    
		path    => $bin_paths,
		command => 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'  
	} 

	# Agrego el repositorio para la instalación de Docker
	exec { 'agrego-repositorio':                    
		path    => $bin_paths,
		command => 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" ',
		unless  => 'find /etc/apt/ -name *.list | xargs cat | grep download.docker.com',
		require => Exec['docker-key'],
	} ->

	exec { 'apt-update':                    
		path    => $bin_paths,
		command => 'apt-get update'  
	}

    # install docker
    $enhancers = [ 'docker-ce', 'docker-compose' ]

    package { $enhancers:
        ensure => 'installed',
    } ->

	# asegurar que el servicio docker se este ejecutando
	service { 'docker':
		ensure => running,
	}

	exec { 'config-app':
		path    => $bin_paths,
		cwd     => '/vagrant/docker/',
		command => 'docker-compose up -d',
		require => Service['docker'],
		unless  => ['test $(docker ps -q -f name=nodejs)', 'test $(docker ps -q -f name=mysql)'],
	}

	#exec { 'config-db':
	#	path    => $bin_paths,
	#	command => 'docker exec mysql /bin/bash /tmp/exec-script.sh',
	#	require => Service['docker'],
	#	onlyif  => 'test $(docker ps -q -f name=mysql)',
	#}

}
