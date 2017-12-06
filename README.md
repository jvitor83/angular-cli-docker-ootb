# Angular CLI with Docker

This is an example app created with the Angular CLI that runs with Docker


I ran `ng new myapp` to generate the app. Then added the 4 docker files:

```bash
.dockerignore
docker-compose.yml
docker-compose.debug.yml
Dockerfile
```

## Running

Two options are available. I prefer the docker compose technique

Option 1) You can run docker build and docker run

  ```
  docker build --rm -f Dockerfile -t angular-cli-docker-ootb:latest .
  docker run --rm -d -p 443:443 -p 80:80 angular-cli-docker-ootb:latest
  ```

Option 2) You can run docker compose `docker-compose up -d --build`


## Faster

This example uses the node alpine image and then installs the latest Angular CLI. If you want to use an image that has node alpine and the Angular CLI already isntalled, you can change your `Dockerfile` to use `johnpapa/angular-cli`. SOmething like this ...

```bash
FROM johnpapa/angular-cli as angular-built
WORKDIR /usr/src/app
COPY package.json package.json
RUN npm install --silent
COPY . .
RUN ng build --prod --build-optimizer

FROM nginx:alpine
LABEL author="John Papa"
COPY --from=angular-built /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80 443
CMD [ "nginx", "-g", "daemon off;" ]
```

The catch on this is that it uses an unofficial docker image that I created. I try to keep it updated, but the latest will always be to install it yourself in the `Dockerfile`