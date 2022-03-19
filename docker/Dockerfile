# Nombre base de la imagen Docker que vamos a utilizar
FROM node:16

# Crea el directorio
WORKDIR /usr/src/app

# copia los archivos
COPY ./configs/node/package*.json ./
COPY ./configs/node/server.js ./

# instalacion
RUN npm install
RUN npm install mysql

# ejecucion
CMD [ "npm", "run", "start.dev" ]