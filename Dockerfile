FROM tomcsi/zabbix-proxy:base

RUN sed -ie s/\#\ ProxyMode=.*/ProxyMode=1/ /etc/zabbix/zabbix_proxy.conf

ENV server 127.0.0.1
ENV hostname zabbix-active-proxy

