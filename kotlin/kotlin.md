# 使用 Mockito 时遇到 MissingMethodInvocationException
Class 与 Method 均设置为 open
http://stackoverflow.com/questions/39365736/a-simple-kotlin-class-with-mockito-test-caused-missingmethodinvocationexception

# 执行编译后的 kotlin main 函数
`java -cp :lib/* your.package.ClassKt`

# There is no checked exceptions in kotlin
> http://stackoverflow.com/questions/36528515/throws-exception-in-a-method-with-kotlin
> https://kotlinlang.org/docs/reference/exceptions.html#checked-exceptions

# 物化泛型
https://discuss.kotlinlang.org/t/reified-generics/1072

# 执行 kotlin script
```
kotlinc FileUtil.kt -include-runtime -d fileutil.jar
java -jar fileutil.jar
```

# 比较 reified class type
```
reified V  ==> Boolean
V::class == Boolean::class  ==> false
V::class == java.lang.Boolean::class  ==> true
```
