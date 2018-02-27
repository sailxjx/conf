# Must learn
* [Pattern matching](https://elixir-lang.org/getting-started/pattern-matching.html)
* [Guard clause](https://hexdocs.pm/elixir/master/guards.html)

`MIX_ENV=prod mix compile`

# Observer
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

# keyword list to map

`Enum.into([topic_id: "can't be blank", created_by: "can't be blank"], %{})`

https://stackoverflow.com/questions/31549555/elixir-how-to-convert-a-keyword-list-to-a-map

# -- 操作符
排除两个 list 中相同的部分
`list1 -- list2`

# 统计方法执行时间
:timer.tc(&function/1, [arg])
