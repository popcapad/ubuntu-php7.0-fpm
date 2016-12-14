#!/bin/sh

mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html

service php7.0-fpm restart

tail -f /dev/null