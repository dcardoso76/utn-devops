# utn-devops
Repositorio para las prácticas del curso "DevOps, integración y agilidad continua" de la UTN

Ejecutar:
en cd /vagrant/docker/

sudo docker-compose up -d

Luego para cargar la BD:

sudo docker exec -i -t mysql /bin/bash

mysql -uroot -proot devops_app < /tmp/script.sql

exit

URL:
http://utn-devops.localhost:8080/
