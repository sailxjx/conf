nginx中的if不支持嵌套和&&或||
可以使用变量或break来支持流程控制

## try_files
location = /favicon.ico {
    try_files /path/to/favicon =404;
}

## redirect
server {
        listen *:80;
        server_name tb.com;
        return 302 $scheme://www.tb.com$request_uri;
}

### turn off 304
if_modified_since off
http://wiki.nginx.org/NginxHttpCoreModule#if_modified_since

### 使用正则表达式配置域名
http://nginx.org/en/docs/http/server_names.html

### rewrite + proxy

https://serverfault.com/questions/379675/nginx-reverse-proxy-url-rewrite

```
rewrite /api(.*) $1  break;
proxy_pass http://127.0.0.1:8323;
proxy_redirect     off;
proxy_set_header   Host $host;
```
