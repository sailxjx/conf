## 设置plist
路径
/Library/LaunchAgents
/Library/LaunchDaemons
## 重启plist
launchctl -w load xxx.plist
## 修改默认shell
chsh -s /bin/zsh

截屏：command + shift + 3

## nginx.plist
/System/Library/LaunchDaemons/nginx.plist
$ launchctl load -F /System/Library/LaunchDaemons/redis.plist

# Homebrew
`brew link pkg` 自动设置软链接
