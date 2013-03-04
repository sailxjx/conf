###Operaters:
* `||=` b||=1, b不存在时设置b为1
* `<=>` 1<=>0=1, 1<=>1=0, 1<=>2=-1
* `===` (1..10) === 5 is true, 5 lies in range 1 to 10

###yield:
```
def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" }
```

###Procs: 
```
group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

over_4_feet = Proc.new do |height|
    height >= 4
end 

can_ride_1 = group_1.select(&over_4_feet)
can_ride_2 = group_2.select(&over_4_feet)
can_ride_3 = group_3.select(&over_4_feet) #这里select和()之间不能有空格
```

###lambda:
```
strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda { |x| x.to_sym }
symbols = strings.collect(&symbolize)
```

###类访问权限
```
class Person
  attr_reader :name #可读成员变量
  attr_writer :id #可写成员变量
  attr_accessor :job #可读写成员变量
  
  def initialize(name, job, id)
    @name = name
    @job = job
    @id = id
  end
end
```

###require,include,extend
```
require 'module' # call Module::func 引入Module模块
include Module  # call func 包含Module作用域中所有方法，省点事儿~
extend Module   # 将Module中的方法作为class的成员
```

###grep
`''.methods.grep /^up/ => [:upto, :upcase, :upcase!]` 捕获所有up开头的String内置方法

###instance_methods
`Class.instance_methods false` 显示Class对象的实例方法，false参数是显示Class本身的方法，而非从superclass中继承的方法，而instance_methods相对于methods的区别是实例化后仍然具有的方法