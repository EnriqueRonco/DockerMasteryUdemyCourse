FROM node:20.12.2-alpine as builder

WORKDIR /home/node/app/test-node

COPY ./test-node/package*.json ./

RUN npm install

COPY ./test-node .

RUN npm run build

EXPOSE 3000

CMD [ "npm", "run", "start" ]
