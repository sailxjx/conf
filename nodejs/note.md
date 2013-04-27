#获取命令行参数
process.argv
#获取文件目录名
path = require 'path'
basedir = path.dirname module.filename

合并两个array:
a = [2,3,4]
a.concat([1,2,3])
=> [2,3,4,1,2,3]

#数组的深拷贝
Array.prototype.clone = ()->
    return [].concat(this)

#对象的深拷贝
b = JSON.parse(JSON.stringify(a))

#类型检测
typeof(1)
=> number
typeof([])
=> number

#substr与substring的区别
substr(index1, length)
substring(index1, index2)

#类型转化
a = 'a'
String(a)   => 'a'
Array(a)    => ['a']
Object(a)   => { 0 : 'a' }