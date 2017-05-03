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

## Tag

`docker tag image_id image_name:tag`

## Environment

`docker run -e "A=B" -d image`

## 跳过缓存重新 Build
`docker build --no-cache=true -t u12_core -f u12_core .`

## Dockerfile FROM 中使用环境变量
`cat Dockerfile | sed "s/FROM.*/FROM $$BASE_IMAGE/" | \
    docker build -t docker-registry.teambition.net/$$IMAGE_NAME -`

## 清除 docker volume 占用磁盘空间

http://blog.yohanliyanage.com/2015/05/docker-clean-up-after-yourself/

https://docs.docker.com/docker-for-mac/faqs/#/how-do-i-reduce-the-size-of-dockerqcow2

```
docker rm -v $(docker ps -a -q -f status=exited)
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)
docker system prune  # > 1.13.0
```

## Dockerfile best practice

```
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    dpkg-sig \
    libcap-dev \
    libsqlite3-dev \
    mercurial \
    reprepro \
    ruby1.9.1 \
    ruby1.9.1-dev \
    s3cmd=1.1.* \
 && rm -rf /var/lib/apt/lists/*
```
