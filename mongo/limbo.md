远程调用时需要注意以下问题

链式调用不可用: db.user.find({}).limit(1).exec(callback) 改为 db.user.find({}, {limit: 1}, callback)
正则表达式不可用: db.user.find({email: /gmail.com/}, {limit: 1}, callback) 改为 db.user.aggregate([{$match: {'email': {$regex: 'gmail.com'}}}, {$limit: 1}])
