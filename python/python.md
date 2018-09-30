###dir(math)
显示math module中所有方法
###type(10)
显示数据类型，可用于比较的有str,int,float,list,dict等等等等。 e.g. type(10) == int
###del
删除变量或者字典中key
###input与raw_input
a = input() 返回值为已存在变量值或内置变量
a = raw_input() 返回值为str
###while/else
如果在while中通过break跳出，则else不会被执行
###enumerate
```
choices = ['pizza', 'pasta', 'salad', 'nachos']
print 'Your choices are:'
for index, item in enumerate(choices):
    print index + 1, item
```
###zip
连接两个数组
`zip([1,2], [2,3,4]) == [(1, 2), (2, 3)]`
###三元运算符
`print a if a > b else b`
###数组or字符串range
```
a = "hello"
a[:::] = "hello"
a[::2] = "hlo"
a[::-1] = "olleh"
a[1:-1] = "ell"
```
###字符串操作
```
"*" * 4 == "****"
```
###list comprehension(列表推导式)
`evens_to_50 = [i for i in range(51) if i % 2 == 0]` 返回0到50之间的所有偶数

###lambda
```
squares = [i ** 2 for i in range(1,11)]
print filter(lambda x: 30 < x < 70, squares)
```
###super
```
class PartTimeEmployee(Employee):
    def full_time_wage(self, hours):
        return super(PartTimeEmployee, self).calculate_wage(hours) # super(ClassName, self).method(params)
```

###指定编码
```
# -*- coding:utf-8 -*-
```

###判断包含
a = 'abcd'
'a' in a
=> True

安装wsgi遇见jk conn_rec' has no member named 'remote_ip的解决方法  
mod_wsgi.c文件自己改一下，把remote_ip和remote_addr分别替换成client_ip和client_addr，哪一行报错就替换哪一行。

### regular expression / regex / 正则表达式

```
# 保留所有中英文
import re
x = ',ok测试/|内容,'
re.sub('[^\u0030-\u007a\u4e00-\u9fff]+', '', x)
```

### any

`any(w in x for w in outlier_words)`

### variable in string

https://stackoverflow.com/questions/2960772/how-do-i-put-a-variable-inside-a-string-in-python

# Force python output unbuffered
禁止缓存 stdout 内容

`python -u script.py`

https://stackoverflow.com/questions/107705/disable-output-buffering
