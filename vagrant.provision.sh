#!/bin/bash

sudo apt-get update

sudo apt-get install -y apache2

if [ ! -f "/swapdir/swapfile" ]; then
	sudo mkdir /swapdir
	cd /swapdir
	sudo dd if=/dev/zero of=/swapdir/swapfile bs=1024 count=2000000
	sudo mkswap -f  /swapdir/swapfile
	sudo chmod 600 /swapdir/swapfile
	sudo swapon swapfile
	echo "/swapdir/swapfile       none    swap    sw      0       0" | sudo tee -a /etc/fstab /etc/fstab
	sudo sysctl vm.swappiness=10
	echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf
fi

if [ -f "/tmp/devops.site.conf" ]; then
	sudo mv /tmp/devops.site.conf /etc/apache2/sites-available
	sudo a2ensite devops.site.conf
	sudo a2dissite 000-default.conf
	sudo service apache2 reload
fi

sudo mkdir /var/www
cd /var/www
sudo git clone https://github.com/Fichen/utn-devops-app.git
cd /var/www/utn-devops-app
sudo git checkout unidad-1

