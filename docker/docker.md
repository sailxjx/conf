# Build

```docker
FROM node:4.4
EXPOSE 8080
COPY server.js .
CMD node server.js
```

```bash
docker build -t hello-node ./
docker run -p 8080:8080 -d hello-node
```

P.S. 不能使用大写字母作为镜像名称

# Login

`docker login hub.docker.com`

# Run with a pseudo tty

`docker run -t -i -d --name ubuntu ubuntu:16.04`

# Attach to a running container

`docker exec -it "id of running container" bash`

# Copy files

```bash
docker cp foo.txt mycontainer:/foo.txt
docker cp mycontainer:/foo.txt foo.txt
```

# Mount a host directory

`docker run -v /host/directory:/container/directory -other -options image_name command_to_run`
