FROM ubuntu:14.04

RUN apt-get update && apt-get install -y software-properties-common python-software-properties

RUN add-apt-repository ppa:ondrej/php && apt-get update && apt-get install -y --force-yes php7.0-fpm php7.0-mysql php7.0-curl curl php7.0-zip unzip

RUN sed -i '/daemonize /c \
daemonize = no' /etc/php/7.0/fpm/php-fpm.conf

RUN sed -i '/max_execution_time /c \
max_execution_time = 900' /etc/php/7.0/fpm/php.ini

RUN sed -i '/upload_max_filesize /c \
upload_max_filesize = 2048M' /etc/php/7.0/fpm/php.ini

RUN sed -i '/post_max_size /c \
post_max_size = 2048M' /etc/php/7.0/fpm/php.ini

RUN sed -i '/^listen /c \
listen = 0.0.0.0:9000' /etc/php/7.0/fpm/pool.d/www.conf

RUN sed -i '/request_terminate_timeout /c \
request_terminate_timeout = 900' /etc/php/7.0/fpm/pool.d/www.conf

RUN sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php/7.0/fpm/pool.d/www.conf

RUN mkdir -p /run/php

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 9000

CMD ["/entrypoint.sh"]