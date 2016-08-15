## 使用 slf4j-log4j12 并开启 DEBUG 模式

```groovy
compile 'org.slf4j:slf4j-api:1.7.21'
compile 'org.slf4j:slf4j-log4j12:1.7.21'
```

```properties
log4j.rootLogger=TRACE, stdout

log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=[%d] %p %m (%c:%L)%n

log4j.logger.org.apache.zookeeper=ERROR
log4j.logger.org.I0Itec.zkclient=ERROR
```
