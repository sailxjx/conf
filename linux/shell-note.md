### 退出前执行命令

http://stackoverflow.com/questions/2129923/bash-run-command-before-a-script-exits

```
set -e
function cleanup {
    echo "Removing /tmp/foo"
      rm  -r /tmp/foo
}
trap cleanup EXIT
mkdir /tmp/foo
asdffdsa #Fails
```

### 将环境变量带入 sudo 命令

http://stackoverflow.com/questions/8633461/how-to-keep-environment-variables-when-using-sudo

`sudo -E $cmd`

