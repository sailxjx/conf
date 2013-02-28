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