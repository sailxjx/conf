# 增加用户
## 管理员用户
use admin
db.addUser("root", "root")
db.auth('root', 'root')
## 数据表用户
use test
db.addUser("tristan", "123456")
## 日志
db.setProfilingLevel(2)
db.system.profile.find()
## 分析
db.tasks.find().explain()

## 加载其他js脚本
load('node_modules/async/lib/async.js')

## ~/.mongorc.js
var EDITOR='vim';  # Set vim as the default editor
function foo() {};
edit foo;
DBQuery.prototype._prettyShell = true;  # Set pretty as the default

## 在script中链接其他数据库
db1 = connect('other.com/otherdb')
### 在一个连接中切换数据库
db1 = db.getSiblingDB('teambition');

## mongo shell 手册
http://docs.mongodb.org/manual/tutorial/write-scripts-for-the-mongo-shell/

## 使用环境变量
在.mongorc.js中设置
