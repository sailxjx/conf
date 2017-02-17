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
