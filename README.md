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
