#!/bin/sh

mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html

exec /usr/bin/php