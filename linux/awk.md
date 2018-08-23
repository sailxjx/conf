awk 'BEGIN{"date"|getline date;print date}'

- getline, 从标准输入中读取对应行数据

# 文件排序

## Pipe to sort (recommend)

awk '{ print $11 "\t" $0 }' | sort -n

## GUN awk asort

awk '{ list[$11] = list[$11] "\t" $0 } END { n = asorti(list, indexes); for (i = 1; i <= n; i++) printf "%s%s\n", indexes[i], list[indexes[i]] }'

## 分割

https://stackoverflow.com/questions/8009664/how-to-split-a-delimited-string-into-an-array-in-awk
awk '{split($0,a,"@");print a[1]}'

## 排除重复行 Remove duplicated lines

https://unix.stackexchange.com/questions/131217/how-to-remove-duplicate-lines-with-awk-whilst-keeping-empty-lines

`cat *.yml  | grep image | awk '!NF || !seen[$0]++ {print $2}'`
