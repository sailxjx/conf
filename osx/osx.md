## 设置plist
路径
/Library/LaunchAgents
/Library/LaunchDaemons
## 重启plist
launchctl -w load xxx.plist
## 修改默认shell
chsh -s /bin/zsh
