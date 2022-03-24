# utn-devops
Repositorio para las prácticas del curso "DevOps, integración y agilidad continua" de la UTN

Ejecutar:
```bash
vagrant up --provision

vagrant ssh
```
En la VM ejecutar:
```bash
sudo puppet agent -t --debug
sudo puppet cert sign utn-devops.localhost
sudo puppet agent -t --debug
```
El segundo comando ejecuta la instalacion de Jenkins mediante Puppet.
Una vez que termina de ejecutarse, ya se puede acceder a Jenkins para la configuracion inicial

http://utn-devops.localhost:8080/

Para la configuracion se debe ingresar una clave generada automaticamente durante la instalacion. La misma se debe leer con el siguiente comando:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
