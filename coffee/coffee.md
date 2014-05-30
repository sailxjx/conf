类成员变量的引用传递。使用constructor方法来避免

使用迭代器：`result = (item.name for item in array)`

object是对象时，`for key, value of object`可以同时得到key与value

`::`可被用来得到对象的prototype属性，`Array::map == Array.prototype.map`

{exec} = require('child_process')  ==>  exec = require('child_process').exec

`Object.prototype.toString.call([])` 一种更精准的判断类型的方法
