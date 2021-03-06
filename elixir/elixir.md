# Must learn
* [Pattern matching](https://elixir-lang.org/getting-started/pattern-matching.html)
* [Guard clause](https://hexdocs.pm/elixir/master/guards.html)

`MIX_ENV=prod mix compile`

# Observer, gui 方式监控 elixir 进程
https://elixir-lang.org/getting-started/mix-otp/supervisor-and-application.html
iex> :observer.start

# Print
IO.inspect

# recompile
iex(1) > recompile

# 转换 struct/schema 到 map

`Map.from_struct`

https://stackoverflow.com/questions/36512627/elixir-convert-struct-to-map

# Distribute

https://hexdocs.pm/elixir/Node.html

# `or` 与 `||` 的区别

https://elixir-lang.org/getting-started/basic-operators.html

# keyword list vs map

https://stackoverflow.com/questions/28180366/what-is-the-benefit-of-keyword-lists

The main drawback of using keyword lists is that it's not possible to perform a partial pattern matching on them:

# keyword list to map, key value pair to map

`Enum.into([topic_id: "can't be blank", created_by: "can't be blank"], %{})`

https://stackoverflow.com/questions/31549555/elixir-how-to-convert-a-keyword-list-to-a-map

# -- 操作符
排除两个 list 中相同的部分
`list1 -- list2`

# 统计方法执行时间
:timer.tc(&function/1, [arg])

# 根据索引获取 / get value by index on list

`Enum.at(list, 1)`

https://til.hashrocket.com/posts/633ba08446-accessing-a-single-element-of-a-list-by-index

# string 字符串模板 / multiline string / 多行字符串

~s(some string)

# add key to map / map 中增加属性

Map.put(m, :key, "value")

# Start mix phx.server with node name

```
elixir --name one@127.0.0.1 --cookie mysecretcookie -S mix phoenix.server
```

# Merge struct

```
struct(Env, %{a: "B"})
```
https://groups.google.com/forum/#!topic/elixir-lang-core/93DBy_WB830

# Multi logger

https://kickinespresso.com/posts/multiple-loggers-in-elixir

# Encode map to yaml

https://elixirforum.com/t/convert-elixir-maps-or-structs-to-yaml/6772/7

`"---\n" <> Poison.encode!(data)`
