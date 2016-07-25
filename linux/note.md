

```bash
# 新增用户和用户组
useradd someone -G somegroup

# 添加用户到用户组
usermod -G somegroup -a someone
```


```bash
# Jobs
jobs -l
# Kill all jobs
kill $(jobs -p)
```

    


```bash
# 查找所有纯文本文件
# http://stackoverflow.com/questions/4767396/linux-command-how-to-find-only-text-files
find . -type f -exec grep -Iq . {} \; -and -print
```
