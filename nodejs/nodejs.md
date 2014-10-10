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

#window.onload
window.onload表示所有dom元素下载结束，假如其中某个静态文件block了，那么这个时间可能会很久

#$(document).ready()
$(document).ready()在html下载结束后就触发，响应较快

#实现补0,strpad
var a = ('000000' + 'a').substr(-6);

#regex,正则表达式
```
var a = '2013-05-07-mysql-btree-yu-hash-suo-yin-bi-jiao.markdown'
var reg = /^\d{4}\-\d{2}\-\d{2}\-(.*)?.markdown$/
var b = a.match(reg)
```

#读取文件
```
var fs = require('fs');
var d = '/Users/tristan/coding/blog/source/_posts/2013-04-28-zai-mac-zhong-an-zhuang-wine.markdown';
fs.createReadStream(d).addListener("data", function(chunk) {
      console.log(chunk.toString());
});
```

#MD5
crypto.createHash(type).update(str, 'utf8').digest('hex');

#获取当前执行目录
fs.realpathSync('.')

#encode html实体
$("<div/>").text('<table>&</table>').html();
#decode html实体
$("<div/>").html('<table>&</table>').text();

#object的迭代
ECMAScript 5中定义
Object.keys(obj) -> arrkey

#四舍五入，round
Number((1/200).toFixed(2))

#defineProperty

#callee
获取自身方法
foo = -> console.log arguments.callee

==> function () {
      return console.log(arguments.callee.toString());
    }

#进制转换
parseInt('ddb93440', 32) ==> 461013880960
461013880960.toString('32') ==> 'ddb93440'

#base64
new Buffer('3755740085282937').toString('base64')
