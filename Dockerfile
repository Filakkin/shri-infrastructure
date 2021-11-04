FROM node:16.13.0-slim
WORKDIR ./app

COPY . .
RUN npm i
RUN npm run

CMD ["npm", "start"]