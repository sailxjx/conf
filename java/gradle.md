### 添加一个任务

```groovy
task getHomeDir << {
    println gradle.gradleHomeDir
}
```

> gradle -q getHomeDir

    /usr/local/homebrew/Cellar/gradle/2.14/libexec

### 任务依赖

```groovy
task taskX(dependsOn: 'taskY') << {
    println 'taskX'
}
task taskY << {
    println 'taskY'
}
```

### 打包到不同文件夹

```groovy
distributions {
  main {
    contents {
      into('bin') {
        from 'bin/'
      }
      into('lib') {
        from jar
        from project.configurations.runtime
      }
    }
  }
}
```

> gradle -q taskX

    taskY
    taskX

### 升级 gradlew 到 3

$ vim gradle/wrapper/gradle-wrapper.properties
 
`distributionUrl=https\://services.gradle.org/distributions/gradle-3.0-all.zip`

### 解决版本冲突
https://docs.gradle.org/current/dsl/org.gradle.api.artifacts.ResolutionStrategy.html

### 创建可执行程序
http://stackoverflow.com/questions/14733566/how-to-run-kotlin-class-from-the-command-line
```
apply plugin: 'application'
mainClassName = "org.apache.kafka.connect.mongo.tools.ImportDataKt"
```

### 忽略嵌套依赖

```
dependencies {
  testCompile('info.batey.kafka:kafka-unit:0.6') {
    exclude module: 'kafka_2.11'
  }
}
```

### 切换 gradle wrapper 版本

`./gradlew wrapper --gradle-version=3.1`

# 单独测试某个 class

`./gradlew test --tests com.teambition.kafka.connect.mongo.assemble.handlers.TaskHandlerTest`
