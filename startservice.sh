#!/bin/sh
/usr/sbin/httpd
su -p -s /bin/sh zabbix -c "/usr/sbin/zabbix_server -f"
