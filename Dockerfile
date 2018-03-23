# FROM johnpapa/angular-cli as angular-built
# Using the above image allows us toskip the angular-cli install
FROM node:8.9-alpine as angular-built
WORKDIR /usr/src/app
COPY . .
RUN npm i -g @angular/cli
RUN npm install --silent
RUN ng build --prod --build-optimizer

FROM nginx:alpine
LABEL author="John Papa"
COPY --from=angular-built /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80 443
CMD [ "nginx", "-g", "daemon off;" ]
