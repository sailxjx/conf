# 以 alpine 为基础镜像编译 scipy 失败

缺少 blas (Basic Linear Algebra Subprograms) 库，安装 openblas

```
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add -U openblas-dev@community
```
