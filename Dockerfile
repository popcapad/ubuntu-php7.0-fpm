FROM ubuntu:14.04

RUN apt-get update && apt-get install -y software-properties-common python-software-properties

RUN add-apt-repository ppa:ondrej/php && apt-get update && apt-get install -y php7.0-fpm php7.0-mysql php7.0-curl curl 

RUN sed -i '/daemonize /c \
daemonize = no' /etc/php5/fpm/php-fpm.conf

RUN sed -i '/^listen /c \
listen = 0.0.0.0:9000' /etc/php5/fpm/pool.d/www.conf

RUN sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php5/fpm/pool.d/www.conf

ADD entrypoint.sh /entrypoint.sh

EXPOSE 9000

ENTRYPOINT["/entrypoint.sh"]

CMD ["php7.0-fpm"]