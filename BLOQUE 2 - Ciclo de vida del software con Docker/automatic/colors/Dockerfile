FROM node:12.13

RUN echo "Workdir creation"
# Workdir creation
WORKDIR /app

RUN echo "Volume creation"
# Volume for the data
VOLUME "$PWD":/app

RUN echo "Copying files"
#COPY package.json ./
#COPY package-lock.json ./
COPY . .

RUN echo "Packages installation"
# install the packages
RUN npm install
RUN npm install -g truffle

EXPOSE 3000

# Execute the DAPP
CMD ["npm", "run", "start"]

# Test the DAPP
#CMD ["bash"]
#ENTRYPOINT ["entrypoint.sh"]

RUN echo "End"