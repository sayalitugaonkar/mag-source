#!/bin/bash
chmod 777 -R /var/www/html/
chown -R test-user:clp /var/www/html/
cd /var/www/
git clone https://github.com/magento/magento2-sample-data.git
ls /magento2-sample-data/
cd /var/www/html/
bin/magento setup:upgrade
bin/magento setup:di:compile
php -f /var/www//magento2-sample-data/dev/tools/build-sample-data.php -- --ce-source="/var/www/html/"
bin/magento setup:static-content:deploy -f
chmod 777 -R /var/www/html/
chown -R test-user:clp /var/www/html/
service nginx restart
service php8.2-fpm restart

