awk 'BEGIN{"date"|getline date;print date}'

* getline, 从标准输入中读取对应行数据