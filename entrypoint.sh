#!/bin/sh

mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html

/usr/bin/php

tail -f /dev/null