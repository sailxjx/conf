# 查看所有表格
SELECT * FROM pg_catalog.pg_tables;

# 安装带 python 依赖的 postgresql

PYTHON=/usr/bin/python brew install postgresql --with-python

```sql
CREATE LANGUAGE plpythonu;

CREATE FUNCTION pymax(a INTEGER, b INTEGER)
  RETURNS INTEGER
AS $$
  if a > b:
    return a
  return b
$$ LANGUAGE plpythonu;
```

# 查询表结构

```
SELECT column_name, data_type, character_maximum_length
FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '<table name>';
```

# 转换列结构
`SELECT cast(cost AS FLOAT), * FROM base_pay_orders;`

# Time with timezone
`SELECT TIMESTAMP WITH TIME ZONE '2017-02-24 08:23:54+8'`

# 设置环境变量密码

http://stackoverflow.com/questions/6405127/how-do-i-specify-a-password-to-psql-non-interactively

`PGPASSWORD=pass1234 psql -U MyUsername myUserName`

# psql 命令
https://dba.stackexchange.com/questions/1285/how-do-i-list-all-databases-and-tables-using-psql
```
\list or \l: list all databases
\dt: list all tables in the current database
\connect database_name connect to database
```

# 用 select 语句建表
```sql
CREATE TABLE IF NOT EXISTS tasks_trend_fact AS (SELECT
  * FROM tasks_dimension
);
```

# 获取 jsonb array 元素

`select array_to_json(stages)->0->>'name' from bkpreferences;`

# 获取 json 子集

`select _extra_props::json#>>'{_projectId, $oid}' from base_projectinfos limit 10;`
