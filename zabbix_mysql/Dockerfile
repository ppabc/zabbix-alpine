FROM alpine:3.7
MAINTAINER ppabc <ppabc@qq.com>
##RUN echo "https://mirrors.aliyun.com/alpine/v3.7/main" > /etc/apk/repositories
##RUN echo "https://mirrors.aliyun.com/alpine/v3.7/community" >> /etc/apk/repositories

COPY mysql /mysql
RUN chmod +x /mysql/install.sh  && chmod +x /mysql/startup.sh && sh /mysql/install.sh

WORKDIR /data

EXPOSE 3306
CMD ["/mysql/startup.sh"]
