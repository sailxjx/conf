## 设置plist
路径
/Library/LaunchAgents
/Library/LaunchDaemons
## 重启plist
launchctl -w load xxx.plist
## 修改默认shell
chsh -s /bin/zsh

截屏：command + shift + 3
部分截屏：command + shift + 4

## nginx.plist
/System/Library/LaunchDaemons/nginx.plist
$ launchctl load -F /System/Library/LaunchDaemons/redis.plist

# Homebrew
`brew link pkg` 自动设置软链接

# Finder
defaults write com.apple.finder AppleShowAllFiles Yes && killall Finder //显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles No && killall Finder //不显示隐藏文件

# 重置蓝牙连接信息
sudo rm -rf /Library/Preferences/com.apple.Bluetooth.plist*
reboot

# 禁止屏幕闪烁
sudo killall coreaudiod
