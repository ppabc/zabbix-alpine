# zabbix-alpine
alpine系统下搭建zabbix server和zabbix_agentd

# alpine-zabbix
zabbix server based on alpine


docker run -d --name zabbix-mysql -v /data/mysql:/data --net=host -it ppabc/zabbix:mysql

