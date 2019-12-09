# 修正 generate reassign partitions 时的超时问题

修改 conf/application.conf 文件，增加超时时间 `kafka-manager.api-timeout-millis=600000`
