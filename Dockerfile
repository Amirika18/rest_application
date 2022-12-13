#FROM node:18-alpine
#WORKDIR /vue
#COPY . .
#EXPOSE 5173
#CMD ["node", "index.js"]


FROM node:lts-alpine as build-app
WORKDIR /vue
COPY package*.json .
COPY . .
RUN npm install
EXPOSE 5173
#ENV HOST=0.0.0.0
CMD ["npm", "run", "dev"]

# latest
#FROM nginx:alpine as production-stage
#EXPOSE 5173
#RUN mkdir /app
#COPY --from=build-app /app /app
#COPY /.nginx/nginx.conf /etc/nginx/nginx.conf


# ====================================================================


#FROM nginx:alpine as production-app
#COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf
#RUN rm -rf /usr/share/nginx/html/*
#COPY --from=build-app /app/dist /usr/share/nginx/html/app


#FROM nginx:alpine as production-build
#COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf
#RUN rm -rf /usr/share/nginx/html/*
#COPY --from=build-app /app/dist /usr/share/nginx/html
#EXPOSE 5173
#ENTRYPOINT ["nginx", "-g", "daemon off;"]