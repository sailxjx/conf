> iptables -t filter -A INPUT -s 192.168.1.1 -j DROP

> ACCEPT | DROP | REJECT
动作：接受 | 丢弃 | 拒绝

> filter | nat | mangle
表：

> INPUT | OUTPUT | FORWARD | PREROUTING | POSTROUTING
链（过滤点）

> iptables -L
显示所有规则

> iptables -I INPUT 1 -p tcp --dport 22 -j ACCEPT
允许所有22端口的tcp流量通过

> iptables -D INPUT 1
删除规则1

> iptables -F
删除所有规则

> -s 192.168.1.1   源地址
> -d 10.0.0.0/8    目标地址
基于ip地址匹配

> -i eth0    接受流量
> -o eth1    发送流量
基于接口（网卡）

> -s '!' 192.168.1.0/24
'!'取反

> -p tcp --dport 22    目标端口
> -p udp --sport 53    源端口
基于协议和端口

网关
iptables -A FORWORD -s 192.168.1.0/24 -d 10.1.1.0/24 -j DROP #禁止

NAT跳转
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-dest 192.168.1.10

