使用apxs工具给apache添加模块
/usr/local/apache/bin/apxs -i -a -c mod_cgi.c
查看apache已加载模块
./apachectl -t -D DUMP_MODULES
