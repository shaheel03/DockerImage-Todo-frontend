FROM node:iron-alpine3.19 as jaggy
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=jaggy /app/build  /usr/share/nginx/html