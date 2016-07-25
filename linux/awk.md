awk 'BEGIN{"date"|getline date;print date}'

- getline, 从标准输入中读取对应行数据

# 文件排序

## Pipe to sort (recommend)

awk '{ print $11 "\t" $0 }' | sort -n

## GUN awk asort

awk '{ list[$11] = list[$11] "\t" $0 } END { n = asorti(list, indexes); for (i = 1; i <= n; i++) printf "%s%s\n", indexes[i], list[indexes[i]] }'
