# Build
$ mkdir hello-node
$ vim server.js

```node
var http = require('http');
var handleRequest = function(request, response) {
    response.writeHead(200);
    response.end("Hello World!");
}
var www = http.createServer(handleRequest);
www.listen(8080);
```

$ vim Dockerfile

```Dockerfile
FROM node:4.4
EXPOSE 8080
COPY server.js .
CMD node server.js
```

$ docker build -t hello-node ./
$ docker run -p 8080:8080 -d hello-node
