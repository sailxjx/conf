## ch*
* `chmod` 文件权限
    +X 只有当文件为目录文件，或者其他类型的用户有可执行权限时，才将文件权限设置可执行
    [Chmod](http://zh.wikipedia.org/wiki/Chmod)
* `chgrp` 文件用户组
* `chown` 文件用户

## netstat
* `netstat -nlep` 查看端口占用情况 [baidu](http://baike.baidu.com/view/28008.htm) [wiki](http://en.wikipedia.org/wiki/Netstat)

## aria2c
* `nohup aria2c --max-download-limit=50K --dir=/home/tristan/Downloads {$file} >> ~/log/aria2c.log 2>&1 & `

## tar
* 压缩 `tar -cvzf {file} {dir}`
* 解压 `tar -xvf {file}`

## mount -a
* `mount //192.168.0.55/d$ /usr/local/win55 -t cifs -o default,username=administrator,password=fanli123,uid=1000,gid=1000`
* 修改/etc/fstab 之后使用`mount -a`生效
* [mount命令详解及实例分析](http://www.diybl.com/course/6_system/linux/Linuxjs/2008827/137937.html)
* osx: `mount //192.168.0.55/d$ /usr/local/win55 -t cifs -o default,nounix,sec=ntlmssp,username=administrator,password=fanli123,uid=1000,gid=1000` (ntlmssp是一种验证服务)

## more
* 查看文件

## echo -e
* echo中让转义符生效

## ldconfig
* 配置动态链接库so

## service
* service mysql stop|start|restart

## nslookup
* nslookup www.google.com 查看域名信息

## expr
* expr 1 + 2 //shell的运算，计算
* bc: echo 1+2|bc
* echo $((1+2))

## wget
* 断点续传 wget -c
* wget "http://www.google.com" -O - //-表示定向到标准输出流

## cut
* echo 2012.6.18 | cut -d'.' -f-2

## bash中的正则表达式验证
* [[ $a =~ regex ]]

## man config文件
* vi /etc/manpath.config

## ifconfig
* ifconfig eth0:0 192.168.0.125 netmask 255.255.255.0 up    //设置ip别名，up立即启用
* ifconfig eth0:0 down  //取消ip设置

## whois
* 查看域名信息

## 下载整站，爬虫
* wget --restrict-file-name=ascii -m -c -nv -np -k -E -p -R=exe,zip http://www.xxx.com

## sort
* sort -n #数字排序
* e.g. du -a|sort -n
* sort -nk2 chars.dic #按第二列排序

## 修改默认shell
* chsh -s /bin/zsh

## who
* 查看登录用户

## w
* 查看用户状态与行为

## pkill -u tristan
* 剔除用户

## ctrl+Z, fg, bg, jobs
* 后台暂停，恢复前台运行，后台继续执行，查看后台进程
* fg %jobid

* cd -
回到上一个工作目录

* date -d "2010-10-18 00:00:00" +%s  #字符串转时间戳
* date -d @1287331200  "+%x %T" #时间戳转字符串

* echo $a 无引号时会去除\t\n
* echo "$a" 有引号会保留结果中的\t\n

* 多行输出
> AWK_SCRIPT=$(cat <<AWK
> BEGIN {
>   a[$1]++
>   if (b != $1) {
>       print $1
>       b = $1
>   }
> }
> AWK)

* zip打包 zip -r verify.zip verify/
* zip解压 unzip verify.zip

* grep -P 使用perl正则
* grep -n 输出行号

* top -bn1 |grep node  #抓取所有node进程

* modprobe  加载内核模块
* lsmod     查看已加载模块
* ldd       查看共享资源库so和lib
* xargs     链接文件名  find . -name 'config.php' | xargs grep 'REDIS'

##删除文件中的\r换行
tr -d '\r' < units.dic > units.dic.c

##分割大文件
split -b 100m mailserver.log maillog/
分割为按字母排序的文件

##查看端口号
lsof -i :3000

##本地shell在远程执行
ssh root@MachineB 'bash -s' < local_script.sh
ssh root@192.168.100.87 'bash -s hello' < echo.sh  # 加参数

##--用于分割标志和直接参数
mkdir -p -- -p

## 硬盘测速
写
dd if=/dev/zero of=/tmp/output.img bs=8k count=256k
读
dd if=/Volumes/Camera\ Card/output.img of=/dev/null bs=64k

## ldconfig
配置动态库文件

## top
top       #按照cpu使用率排序     #按内存使用率排序
On Mac    `o cpu`              `o mem`
On Linux  `P`                  `M`

## gzip

解压缩 gzip -d somefile.gz

## 修改 hostname
hostname xxx

## dtruss
system call truss

## 后台/执行/前台
ctrl + z / bg / fg

## 找到所有非二进制文件
find . -type f -exec grep -Il "" {} \;

## 查看文件修改时间戳
OSX: stat -f "%m" .
LINUX: stat --printf='%Y\n' .

## 按文件大小排序
find . -name '*coffee' | xargs stat -f '%z %N' | sort -n

## 结束所有当前 session 下任务
kill `jobs -p`

jobs -x kill

## 搜索软件包
apt-cache search openjdk

## 查询所有端口占用进程
http://stackoverflow.com/questions/750604/freeing-up-a-tcp-ip-port
`fuser -uv 80/tcp`
`fuser -k 80/tcp`

## 查找子程序

`pgrep -P $parent_pid`

## 查看公网 ip

`dig +short myip.opendns.com @resolver1.opendns.com`

# 查看磁盘 IO

`iostat -xtm 1`

# 查看网络 IO

`iftop -i eth0 -B`
