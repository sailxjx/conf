类成员变量的引用传递。使用constructor方法来避免

使用迭代器：`result = (item.name for item in array)`

object是对象时，`for key, value of object`可以同时得到key与value

`::`可被用来得到对象的prototype属性，`Array::map == Array.prototype.map`

{exec} = require('child_process')  ==>  exec = require('child_process').exec

`toString.call([])` 一种更精准的判断类型的方法

coffee.emit
coffee.on 'failure', ->
coffee.on 'compile', ->
coffee.on 'success', ->

## 编写自己的stream类

```coffeescript
{Writable} = require 'stream'

class ParseStream extends Writable

  write: (chunk) ->
    @emit 'data', chunk
    @emitLine chunk

  end: (chunk) ->
    if chunk?
      @emit 'data', chunk
      @emitLine chunk
    @emit 'end'
```

## 判断是 require 还是直接执行
analyser() if require.main is module

## 在 cs 中使用 js

```coffeescript
y = 0;
test = (x) ->
  `var y`
  y = 10
  x + y;

alert test 5
alert y
```
# 多进制数字表示方式
二进制 0b001
八进制 0o001
十六进制  0x001

# 设置 Error 堆栈长度
Error.stackTraceLimit = Infinity

# 连接 buffer
Buffer.concat [buf1, buf2]

# 取得临时文件夹地址
os.tmpdir()
