1. 时间处理
  1. 格式化时间为字符串 `to_char(getdate(), 'YYYYMMDD')`
  2. 转换时间为天/月/年 `date_trunc('month', getdate())`
  3. 增减时间 `SELECT dateadd(DAY, 1, getdate())`
  4. unix 时间戳转为格式化时间 `select timestamp 'epoch' + timestamp_column * interval '1 second' as timestamp_column`
  5. 时间转为 unix 时间戳 `extract('epoch' from current_timestamp)` 


2. Interval 转换为 Integer 

`extract(SECONDS FROM (end_time - start_time))`

# 移除死锁的 query
```
SELECT * FROM stv_recents
WHERE query like '%base_customers%'
  AND status = 'Running';

SELECT pg_terminate_backend(pid);
```

