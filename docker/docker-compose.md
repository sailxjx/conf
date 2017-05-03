# Reference

https://docs.docker.com/compose/compose-file

### 覆盖原命令

`command` https://docs.docker.com/compose/compose-file/#command

### expose 与 ports 区别

* `expose` 只能在容器间访问
* `ports` 暴露在 host 上

### links, entrypoint

* links 连接其他容器, 如果使用 link host 连接，必须使用容器内 port 访问
* entrypoint 替换 entrypoint

```
version: '2'
services:
  postgres:
    image: postgres:9.6-alpine
    volumes:
      - /data/private-cloud/postgres:/var/lib/postgresql/data
    ports:
      - 15432:5432
    environment:
      TZ: Asia/Shanghai
      POSTGRES_PASSWORD: docker
  metabase:
    image: docker-registry.teambition.net/library/metabase
    entrypoint: sh -c "while true; do sleep 1; done"
    depends_on:
      - postgres
    restart: always
    ports:
      - 13000:3000
    environment:
      TZ: Asia/Shanghai
      JAVA_OPTS: -Xmx2G -Duser.timezone=Asia/Shanghai
      MB_DB_TYPE: postgres
      MB_DB_DBNAME: metabase
      MB_DB_PORT: 5432
      MB_DB_USER: postgres
      MB_DB_PASS: docker
      MB_DB_HOST: postgres
    links:
      - postgres
```
