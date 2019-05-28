# Partition by

<http://www.sqltutorial.org/sql-window-functions/sql-partition-by/>

修改窗口函数 (xxx over()) 的作用范围，不变更返回行数 (与 group by 的区别)

```sql
-- 每个用户平均价格
select
  *,
  avg(TOTAL)
  over (
    partition by USER_ID
    ) as avg_price
from orders

-- 每用户每单价格排序
select
  *,
  rank()
  over (
    partition by user_id
    order by total desc
    ) as price_rank
from orders
  order by id
```

`rank` 与 `row_number` 区别： rank 将值相同的行归为同一个排名，例如会出现 1,2,2,4,5 这样的排序 (跳过了 3)
