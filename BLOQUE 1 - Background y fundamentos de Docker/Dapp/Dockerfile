FROM node:14.17.6
# Creación de un directorio
WORKDIR /usr/src/app
# Instalación de dependencias
# Se para asegurar que se copien tanto package.json como 
# package-lock.json cuando estén disponibles 
COPY package*.json ./
RUN rm -rvf node_modules/ package-lock.json
RUN npm i -f
RUN npm install
RUN npm install -g truffle@5.4.5
COPY . .
EXPOSE 3000
ENTRYPOINT [ "sh" ]

