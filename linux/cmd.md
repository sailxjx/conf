* ch*
    `chmod` 文件权限
    `chgrp` 文件用户组
    `chown` 文件用户
* netstat
    `netstat -nlep` 查看端口占用情况 [baidu](http://baike.baidu.com/view/28008.htm) [wiki](http://en.wikipedia.org/wiki/Netstat)
* aria2c
    nohup aria2c --max-download-limit=50K --dir=/home/tristan/Downloads {$file} >> ~/log/aria2c.log 2>&1 & 
* tar
    压缩 tar -cvzf {file} {dir}
    解压 tar -xvf {file}
* mount -a
    mount //192.168.0.55/d$ /usr/local/win55 -t cifs -o default,username=administrator,password=fanli123,uid=1000,gid=1000
    修改/etc/fstab 之后使用mount -a生效
    [mount命令详解及实例分析](http://www.diybl.com/course/6_system/linux/Linuxjs/2008827/137937.html)
