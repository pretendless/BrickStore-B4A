# FROM node:lts-alpine
# ENV NODE_ENV=production
# WORKDIR /usr/src/app
# COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
# RUN npm install --production --silent && mv node_modules ../
# COPY . .
# RUN npm run build
# EXPOSE 3000/tcp
# RUN chown -R node /usr/src/app
# USER node
# CMD ["npm", "start"]

FROM node:20-alpine
WORKDIR /usr/src/app
COPY package*.json  ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 3000/tcp
CMD [ "node", "dist/main.js" ]
