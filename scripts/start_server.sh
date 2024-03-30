#!/bin/bash
chmod 777 -R /var/www/html/
service nginx restart
service php8.2-fpm restart

