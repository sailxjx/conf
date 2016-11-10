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

> gradle -q taskX

    taskY
    taskX

### 升级 gradlew 到 3

$ vim gradle/wrapper/gradle-wrapper.properties
 
`distributionUrl=https\://services.gradle.org/distributions/gradle-3.0-all.zip`

### 解决版本冲突
https://docs.gradle.org/current/dsl/org.gradle.api.artifacts.ResolutionStrategy.html
