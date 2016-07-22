

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

    
