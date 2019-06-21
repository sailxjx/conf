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

# Call super function

https://stackoverflow.com/questions/805066/call-a-parent-classs-method-from-child-class-in-python

```
class Foo(Bar):
    def baz(self, arg):
        return super(Foo, self).baz(arg)
```

# Assignment destructoring

```
[name, *others] = "meta_model__lr__C".split("__")
```

# Show doc

```
help(func)
func.__doc__
# In notebook
func?
func??
```

# print without new line

https://stackoverflow.com/questions/493386/how-to-print-without-newline-or-space

`print('.', end='')`


# re.sub with group

https://stackoverflow.com/questions/8157267/handling-backreferences-to-capturing-groups-in-re-sub-replacement-pattern
`re.sub(r'([\u4e00-\u9fff]) +([\u4e00-\u9fff])', r'\1\2', "重要 接到 a b")`

# 在 jupyter notebook 中安装和引用 package

```
!pip install --user altair
import sys
sys.path.append("/home/sailxjx/.local/lib/python3.5/site-packages")
import altair as alt
```

# 获取对象方法名

https://stackoverflow.com/questions/1911281/how-do-i-get-list-of-methods-in-a-python-class

```
import inspect
inspect.getmembers(data, predicate=inspect.ismethod)
```

# 包含默认值的字典

https://www.accelebrate.com/blog/using-defaultdict-python/

```
>>> from collections import defaultdict
>>> ice_cream = defaultdict(lambda: 'Vanilla')
>>>
>>> ice_cream = defaultdict(lambda: 'Vanilla')
>>> ice_cream['Sarah'] = 'Chunky Monkey'
>>> ice_cream['Abdul'] = 'Butter Pecan'
>>> print ice_cream['Sarah']
Chunky Monkey
>>> print ice_cream['Joe']
Vanilla
>>>
```

# 解决 pytest test 文件无法 import src 目录模块的问题

`PYTHONPATH=src pytest`

# Bytes to string

`b'abc'.decode('utf-8')`
