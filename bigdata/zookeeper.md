# 查看 zookeeper 状态

echo mntr | nc localhost 2181

# 为 zookeeper 增加 acl 权限

https://blog.csdn.net/liuxiao723846/article/details/79391650

ip 限制
`setAcl /node2 ip:192.168.100.1:cdrwa`

设置 acl 后该节点无法访问，但子节点仍然可以访问，但是读取不到数据（无法 get）
