# stage 0 build
FROM node:19-alpine as build-stage
#RUN mkdir /app
WORKDIR /app
COPY package*.json /app
RUN npm install
COPY . /app
RUN npm run build


# stage 1 deploy to nginx
FROM nginx:1.17
COPY --from=build-stage /app/build/ /usr/share/nginx/html
#如果有自定义的ngx配置
#COPY --from=build-stage /app/nginx.conf /etc/nginx/conf.d/default.conf

