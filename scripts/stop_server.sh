#!/bin/bash
service nginx stop
service php8.2-fpm stop
rm -rf /var/www/html/
mkdir -p /var/www/html/
chmod 777 -R /var/www/html/