# Nombre base de la imagen Docker que vamos a utilizar
FROM node:16

# Crea el directorio
WORKDIR /srv/

RUN git clone https://github.com/dcardoso76/utn-devops-app.git

WORKDIR /srv/utn-devops-app/src

# instalacion
RUN npm install
RUN npm install mysql

# ejecucion
CMD [ "npm", "run", "start.dev" ]
