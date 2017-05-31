1. 时间处理
  1. 格式化时间为字符串 `to_char(getdate(), 'YYYYMMDD')`
  2. 转换时间为天/月/年 `date_trunc('month', getdate())`
  3. 增减时间 `SELECT dateadd(DAY, 1, getdate())`


2. Interval 转换为 Integer 

`extract(SECONDS FROM (end_time - start_time))`
