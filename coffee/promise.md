下面以 bluebird 模块举例

- map, all 均为并行执行， each, reduce 为按顺序执行
- map, each, reduce 会因为 error 而停止后续 promise 执行， all 不会
