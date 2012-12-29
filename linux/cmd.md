###### ch*
* `chmod` 文件权限
    +X 只有当文件为目录文件，或者其他类型的用户有可执行权限时，才将文件权限设置可执行
    [Chmod](http://zh.wikipedia.org/wiki/Chmod) 
* `chgrp` 文件用户组
* `chown` 文件用户

###### netstat
* `netstat -nlep` 查看端口占用情况 [baidu](http://baike.baidu.com/view/28008.htm) [wiki](http://en.wikipedia.org/wiki/Netstat)

###### aria2c
* `nohup aria2c --max-download-limit=50K --dir=/home/tristan/Downloads {$file} >> ~/log/aria2c.log 2>&1 & `

###### tar
* 压缩 `tar -cvzf {file} {dir}`
* 解压 `tar -xvf {file}`

###### mount -a
* `mount //192.168.0.55/d$ /usr/local/win55 -t cifs -o default,username=administrator,password=fanli123,uid=1000,gid=1000`
* 修改/etc/fstab 之后使用`mount -a`生效
* [mount命令详解及实例分析](http://www.diybl.com/course/6_system/linux/Linuxjs/2008827/137937.html)

###### more
* 查看文件

###### echo -e
* echo中让转义符生效 

###### ldconfig
* 配置动态链接库so 

###### service
* service mysql stop|start|restart 

###### nslookup
* nslookup www.google.com 查看域名信息

###### expr
* expr 1 + 2 //shell的运算

###### wget
* wget "http://www.google.com" -O - //-表示定向到标准输出流

###### cut
* echo 2012.6.18 | cut -d'.' -f-2

###### bash中的正则表达式验证
* [[ $a =~ regex ]]

###### man config文件
* vi /etc/manpath.config

###### ifconfig
* ifconfig eth0:0 192.168.0.125 netmask 255.255.255.0 up    //设置ip别名，up立即启用
* ifconfig eth0:0 down  //取消ip设置

###### whois
* 查看域名信息

###### 下载整站 
* wget --restrict-file-name=ascii -m -c -nv -np -k -E -p -R=exe,zip http://www.xxx.com

###### sort
* sort -n #数字排序
* e.g. du -a|sort -n

###### 修改默认shell
* chsh -s /bin/zsh

###### who
* 查看登录用户

###### w
* 查看用户状态与行为

###### pkill -u tristan
* 剔除用户
