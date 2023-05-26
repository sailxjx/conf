# apt 中使用代理
```
ubuntu@ubuntu:~$ cat /etc/apt/apt.conf
Acquire::http::Proxy "http://Username:Password@proxy.foo.bar.edu.au:8080";
```
https://askubuntu.com/questions/7470/how-to-run-sudo-apt-get-update-through-proxy-in-commandline
