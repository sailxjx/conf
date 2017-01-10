## Examples
* http://www.journaldev.com/1352/what-is-jmx-mbean-jconsole-tutorial
* http://docs.oracle.com/javase/8/docs/technotes/guides/jmx/examples.html

## JXM port
* http://stackoverflow.com/questions/10331189/how-to-find-the-default-jmx-port-number

## 连接 docker
* https://forums.docker.com/t/enable-jmx-rmi-access-to-a-docker-container/625/4
增加选项 `-Dcom.sun.management.jmxremote.local.only=false -Djava.rmi.server.hostname=192.168.99.100`
