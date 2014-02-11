###array push
ARRAY=()
ARRAY+=('foo')
ARRAY+=('bar')

###number range
for i in {0..10}; do; echo $i; done;
for i in `seq 10`; do; echo $i; done;
max=10; for in in `seq 0 $max`; do echo $i; done;

###EOF
cat <<EOF!!
echo 1
EOF!!

### 默认值
PORT=${1:-$default}

### 截取字符串最后一个字符
echo ${STRING:$((${#STRING} - 1)):1}

