FROM ubuntu:14.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget && \
    wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb && \
    dpkg -i zabbix-release_3.0-1+trusty_all.deb && \
    rm -f zabbix-release_3.0-1+trusty_all.deb && \
    apt-get update && \
    apt-get install -y zabbix-proxy-sqlite3 && \
    mkdir -p /var/run/zabbix && chown -R zabbix:zabbix /var/run/zabbix && \
    mkdir -p /var/lib/zabbix && chown -R zabbix:zabbix /var/lib/zabbix

EXPOSE 10051

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]

