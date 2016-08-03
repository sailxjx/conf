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
