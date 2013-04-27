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

yield x if block_given?  # 非必要条件

###Procs: 
Proc.new {"xxx"} == proc {"xxx"}

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

简洁lambda:
```
callable = ->(x) { x + 1 }
callable.call 3
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

###.class
* "fasdf".class  => String
* 10.1.class => Float

###创建白板类
```
class BlankSlate
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__send__|__id__|object_id$/
  end
end
puts BlankSlate.instance_methods
```

###判断包含
a = 'abcd'
a.include?('a')
=> true

###File
当前文件相对路径: __FILE__
当前文件绝对路径: File.expand_path(__FILE__)
当前文件夹相对路径: File.dirname(__FILE__)

###&操作符，传入block
def func(x, &y)
end

###Proc与lambda区别
Proc: return关键字从当前作用域返回
lambda: return关键字从lambda中返回

def double(obj)
  obj.call * 2
end
```
# p = proc {return 10}  # error
# p = proc {10}  # right
p = lambda {return 10}  # right
puts double p
```

Proc对参数数量的容忍度比lambda高

在我看来，Proc和lambda都是为了延迟执行代码块

###文件遍历
Dir.glob('*.rb')

###array部分选取(filter)
a = [1,2,3]
a.select {|x| 10 % x == 0}  => [1, 2]  # 同样需要用0比较，0是不等于false或nil滴

###方法可见度
class Base
    def initialize()
        set_defaults()
        #other stuff
    end

    protected
    def set_defaults()
        # defaults for this type
        @foo = 7
        calculate_and_set_baz()
    end

    private
    def calculate_and_set_baz()
        @baz = "Something that only base classes have like a file handle or resource"
    end
end

###深拷贝，复制
a = {}
b = a.clone

###respond_to?
File.respond_to?('lchmod')  # => true

###Time
* Time.now.strftime "%Y%m%d%H%M%S"  # 格式化时间

###~/.irbrc
irb配置文件
* require 'irb/completion'  # 开启自动完成

###`%` things
* %w() is another way to write array
* %r() is another way to write a regular expression.
* %q() is another way to write a single-quoted string (and can be multi-line, which is useful)
* %Q() gives a double-quoted string
* %x() is a shell command