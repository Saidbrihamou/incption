#!/bin/bash
wget https://wordpress.org/wordpress-6.8.1.tar.gz
tar -xvzf wordpress-6.8.1.tar.gz
mv wordpress/* /var/www/wordpress/
sed -i "s/DATABASE_NAME_RP/$MYSQL_WORDPRESS/" wp-config.php
sed -i "s/USERNAME_RP/$MYSQL_USER/" wp-config.php
sed -i "s/PASSOWRD_RP/$MYSQL_PASS/" wp-config.php
mv wp-config.php /var/www/wordpress/
mv www.conf $(find /etc/php/ -type f -name www.conf)
rm -rf wordpress wordpress-6.8.1.tar.gz
mkdir -p /run/php
chown -R www-data:www-data /var/www/wordpress
chmod -R 755 /var/www/wordpress
sleep 5


#setup chaching in wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root


$(find /usr/sbin/ | grep php-fpm) -F

