## 清除ibdata1(innodb)文件
* 备份数据 #/usr/local/mysql/bin/mysqldump -uroot --quick --force --routines --add-drop-database --all-databases --add-drop-table > /data/backup/mysqldump.sql
* 停止mysql #/etc/init.d/mysql stop
* 删除mysql文件夹以外的所有文件 #rm /data/mysql/ibdata1 /data/mysql/ib_logfile* /data/mysql/mysql-bin.*
* 启动mysql #/etc/init.d/mysql start
* 恢复数据 #/usr/local/mysql/bin/mysql -uroot < /data/backup/mysqldump.sql

## 安全删除日志文件
* PURGE MASTER LOGS TO 'MySQL-bin.010';

## innodb每个表一个idb文件
* my.cnf中加innodb_file_per_table

##创建用户并赋予权限
CREATE USER 'rails'@'%' IDENTIFIED BY 'rails';
grant all privileges on *.* to rails@`%` identified by `rails`;

##修改密码
update user set password = password("rails") where user = "rails";
flush privileges;  ##刷新权限表