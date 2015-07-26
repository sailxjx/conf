# 备份数据库
mongodump --host localhost -d teambition -o /data/backup
# 恢复数据库
mongorestore --dbpath /data/mongo /data/backup
# 停止mongod
mongod -f /etc/mongodb.conf --shutdown

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

## 修改profile size
db.setProfilingLevel(0)
db.system.profile.drop()
db.createCollection( "system.profile", { capped: true, size:4000000 } )
db.setProfilingLevel(1)

## 删除 profile
db.setProfilingLevel(0)
db.system.profile.drop()

## 创建 sparse 索引
db.messages.ensureIndex({team: 1, creator: 1, to: 1, _id: -1}, {background: true, sparse: true})

## 删除索引
db.messages.dropIndex('room_1')
db.messages.dropIndex({team: 1})

## 查看单个 collection 状态
db.collection.stats()

## 查看集群状态
rs.status()

## 执行 script
mongo <<EOF
  print("hello world")
EOF

mongoexport --host=192.168.0.21 --port=27017 -u root -p root --authenticationDatabase=admin -f name,email,emailDomain,globalRole,createdAt,sourceId -d talksync -c users --type=csv -o talk_user.csv
