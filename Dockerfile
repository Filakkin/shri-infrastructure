FROM node:12
WORKDIR ./app

COPY . .
RUN npm i
RUN npm run

CMD ["npm", "start"]