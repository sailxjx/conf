
#### Array
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


#### Range


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


#### EOF


```bash
cat <<EOF
echo 1
EOF
```

    echo 1


#### 默认值


```bash
DEFAULT=1024
PORT=${1:-$DEFAULT}
echo $PORT
```

    1024


#### 截取字符串最后一个字符


```bash
STRING="ABCDE"
echo ${STRING:$((${#STRING} - 1)):1}
```

    E


#### Pipe


```bash
echo "hello world" | { read text; echo $text; }
cat <<EOF | { read text; echo $text; }
hello world
EOF
```

    hello world
    hello world


#### Echo to stderr


```bash
>&2 echo "error"
```

    error


#### Cut string


```bash
echo 4087507e27553beda51103bfc2bacd4ef63411a6 refs/remotes/origin/HEAD | cut -d ' ' -f1
```

    4087507e27553beda51103bfc2bacd4ef63411a6


#### Compare two line of git ref


```bash
git show-ref master | cut -d ' ' -f1 | uniq | wc -l | tr -d '[[:space:]]'
```

    1

#### Pushd/dirs/popd


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


#### 检测到未设置变量时报错并退出程序


```bash
echo $undefined-ok
# -e 报错时退出，-u 报错处理未设置变量
set -eu
echo $undefined-ok
# 恢复设置
set +eu
```

#### `trap` 捕获信号并执行命令


```bash
function handle_exit {
  echo -e "Exit without error."
  exit
}

trap "set +x; handle_exit" SIGQUIT SIGTERM SIGINT SIGHUP
```

#### 设置未定义变量


```bash
: ${VERSION:="2.0"}
echo $VERSION
```

    2.0


#### 将 heredoc 赋值给变量


```bash
# http://stackoverflow.com/questions/1167746/how-to-assign-a-heredoc-value-to-a-variable-in-bash
read -r -d '' HELP <<EOF
HELP ME
PLEASE!
EOF

# 保留换行需要在变量两旁加双引号
echo "$HELP"
```

    HELP ME
    PLEASE!


#### 替换变量内容


```bash
# http://unix.stackexchange.com/questions/104881/remove-particular-characters-from-a-variable-using-bash
VERSION='2.3.3'
echo "${VERSION//.}"
```

    233


#### 转义 $ 符号


```bash
cat << \EOF
$PATH
EOF
```

    $PATH


#### top 特定程序


```bash
top -c -p $(pgrep -d',' -f string_to_match_in_cmd_line)
```

# Get exit code of a background process
https://stackoverflow.com/questions/1570262/get-exit-code-of-a-background-process

# Replace string

```
orig="AxxBCyyyDEFzzLMN"
mod=${orig//[xyz]/_}
```

https://stackoverflow.com/questions/2871181/replacing-some-characters-in-a-string-with-another-character

# Add numbers

`V_NEW_PATCH=$(($V_PATCH + 1))`

# Copy content of dir to other dirs

https://stackoverflow.com/questions/3643848/copy-files-from-one-directory-into-an-existing-directory
`cp -R t1/. t2/`

# exec and eval

https://unix.stackexchange.com/questions/296838/whats-the-difference-between-eval-and-exec

* exec: 在当前 shell process 下执行命令，pid 与 sh 相同（正常 shell 执行命令是 fork 一个子进程）
* eval: 在当前 shell 下执行参数中的命令，类似 sh -c，但是省去了引号

# 避免 shell 在命令中自动增加 '"

使用 eval
https://stackoverflow.com/questions/6087494/bash-inserting-quotes-into-string-before-execution

# 使用乘法

https://stackoverflow.com/questions/27218141/multiplication-with-expr-in-shell-script
`expr 2 \* 2`

# Sort by human readable size

https://unix.stackexchange.com/questions/524760/how-to-sort-human-readable-size

`du -d 1 -h | sort -h`

# Write empty file

https://stackoverflow.com/questions/139261/how-to-create-a-file-with-a-given-size-in-linux

`dd if=/dev/zero of=upload_test bs=75497472 count=1`

# Kill subprocess

https://stackoverflow.com/questions/2618403/how-to-kill-all-subprocesses-of-shell

`pkill -P $$`
