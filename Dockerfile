FROM node:lts-alpine as build-app
WORKDIR /vue
#COPY . .
RUN apk update && apk add git
RUN git clone -b enaumova https://github.com/FoilHatGuy/rest_application.git
RUN mv -v ./rest_application/* ./
RUN rm -r rest_application
COPY ./params.js ./params.js
RUN npm install
EXPOSE 5173
CMD ["npm", "run", "dev"]

# latests
#FROM nginx:alpine as production-stage
#EXPOSE 5173
#RUN mkdir /app
#COPY --from=build-app /app /app
#COPY /.nginx/nginx.conf /etc/nginx/nginx.conf
