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
Una vez que termina de ejecutarse, ya se puede acceder a Jenkins para la configuracion inicial.

**NOTA**: En algunos casos la segunda ejecución falla porque encuentra un archivo que le indica a puppet que el agente aún se está ejecutando.
Para salvar esto ejecutar el siguiente comando antes de volver a ejecutar puppet agent:
```bash
sudo rm /var/lib/puppet/state/agent_catalog_run.lock
```

http://utn-devops.localhost:8082/

Para la configuracion se debe ingresar una clave generada automaticamente durante la instalacion. La misma se debe leer con el siguiente comando:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
