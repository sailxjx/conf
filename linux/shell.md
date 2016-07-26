
### Array
http://stackoverflow.com/questions/8880603/loop-through-array-of-strings-in-bash-script


```bash
ARRAY=()
ARRAY+=('foo')
ARRAY+=('bar')
echo ${ARRAY[@]}

ARR=("ABC" "EF  TG")
for STR in "${ARR[@]}"; do
  echo "$STR"
done
```

    foo bar
    ABC
    EF  TG


### Range


```bash
for i in {0..10}; do echo $i; done
for i in `seq 10`; do echo $i; done;
max=10; for in in `seq 0 $max`; do echo $i; done;
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    10
    10
    10
    10
    10
    10
    10
    10
    10
    10
    10


### EOF


```bash
cat <<EOF
echo 1
EOF
```

    echo 1


### 默认值


```bash
DEFAULT=1024
PORT=${1:-$DEFAULT}
echo $PORT
```

    1024


### 截取字符串最后一个字符


```bash
STRING="ABCDE"
echo ${STRING:$((${#STRING} - 1)):1}
```

    E


### Pipe


```bash
echo "hello world" | { read text; echo $text; }
cat <<EOF | { read text; echo $text; }
hello world
EOF
```

    hello world
    hello world


### Echo to stderr


```bash
>&2 echo "error"
```

    error


### Cut string


```bash
echo 4087507e27553beda51103bfc2bacd4ef63411a6 refs/remotes/origin/HEAD | cut -d ' ' -f1
```

    4087507e27553beda51103bfc2bacd4ef63411a6


### Compare two line of git ref


```bash
git show-ref master | cut -d ' ' -f1 | uniq | wc -l | tr -d '[[:space:]]'
```

    1

### Pushd/dirs/popd


```bash
echo -e "[Origin dirs stack]        " `dirs`
echo -e "[Push and enter new dir]   " `pushd ~/coding/conf/ruby`
echo -e "[New dirs stack]           " `dirs`
echo -e "[Pop last dir]             " `popd`
```

    [Origin dirs stack]         ~/coding/conf/ruby ~/coding/conf/linux
    [Push and enter new dir]    ~/coding/conf/ruby ~/coding/conf/ruby ~/coding/conf/linux
    [New dirs stack]            ~/coding/conf/ruby ~/coding/conf/linux
    [Pop last dir]              ~/coding/conf/linux

