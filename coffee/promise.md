下面以 bluebird 模块举例

- map, all 均为并行执行， each, reduce 为按顺序执行
- map, each, reduce 会因为 error 而停止后续 promise 执行， all 不会

同时使用 callback 与 promise

```
Promise = require 'bluebird'

foo = (key, callback) ->
  Promise.resolve()
  .then ->
    new Promise (resolve, reject) ->
      setTimeout ->
        reject new Error(key)
      , 100
  .then (key) -> callback? null, key
  .catch callback

foo 'ok', (err, key) -> console.log 'err', err

foo 'ok'
.catch (err) -> console.log 'err', err
```
