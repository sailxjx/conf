# 可变参数
```lua
local foo = function (...)
  local args = {...}
  print('Arg number', #args)
  for i, v in ipairs(args) do
    print(i, v)
  end
end

foo(1,2,3,5,6,7,8)
```

# 指定模块加载路径
```lua
package.path = package.path..';/path/to/packages/?.lua'
```

# xpcall 含参数方法
```lua
local function add(a,b)
   assert(type(a) == "number", "a is not a number")
   assert(type(b) == "number", "b is not a number")
   return a+b
end

local function errHandler (err)
  print("Err", err)
end

local status = xpcall(add, errHandler, 10, 20)
```
