#!/bin/bash
cd /var/www/
git clone https://github.com/magento/magento2-sample-data.git
cd /var/www/html/
chmod 777 -R /var/www/
chown -R test-ssh:clp /var/www/
composer install --ignore-platform-req=ext-sodium --optimize-autoloader --prefer-dist --no-dev
composer dump-autoload -o
bin/magento module:enable --all
bin/magento setup:upgrade
bin/magento setup:di:compile
php -f /var/www/magento2-sample-data/dev/tools/build-sample-data.php -- --ce-source="/var/www/html/"
bin/magento setup:static-content:deploy -f
chmod 777 -R /var/www/html/
chown -R test-ssh:clp /var/www/html/
service nginx restart
service php8.2-fpm restart
