FROM alpine:3.7
MAINTAINER ppabc <ppabc@qq.com>
#RUN echo "https://mirrors.aliyun.com/alpine/v3.7/main" > /etc/apk/repositories
#RUN echo "https://mirrors.aliyun.com/alpine/v3.7/community" >> /etc/apk/repositories

ENV MAINLAND Y
COPY zabbix /zabbix
RUN /zabbix/install.sh
EXPOSE 80 443 10050 10051
CMD /zabbix/startservice.sh
