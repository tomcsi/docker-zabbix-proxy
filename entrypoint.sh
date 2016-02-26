#!/bin/bash

sed -ie s/\#\ ProxyMode=.*/ProxyMode=0/ /etc/zabbix/zabbix_proxy.conf
sed -ie s/Server=.*/Server=${server}/ /etc/zabbix/zabbix_proxy.conf
sed -ie s/Hostname=.*/Hostname=${hostname}/ /etc/zabbix/zabbix_proxy.conf

sudo -EHu zabbix bash -c "cd; /usr/sbin/zabbix_proxy -f"

