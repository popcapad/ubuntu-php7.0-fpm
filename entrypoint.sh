#!/bin/sh

find /var/www/html/* -not -user www-data -execdir chown www-data:www-data {} \+

php-fpm7.0 --nodaemonize
