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
