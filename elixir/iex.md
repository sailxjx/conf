# debug

add `IEx.pry` in source code
run `iex -S mix test --trace ...`

http://blog.plataformatec.com.br/2016/04/debugging-techniques-in-elixir-lang/

# 以 distributed 方式启动程序

```
iex --sname one
iex --sname two
iex> Node.connect :one@Dee
```

http://benjamintan.io/blog/2014/05/25/connecting-elixir-nodes-on-the-same-lan/

