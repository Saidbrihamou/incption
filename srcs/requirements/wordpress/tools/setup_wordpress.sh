#!/bin/bash
wget https://wordpress.org/wordpress-6.8.1.tar.gz
tar -xvzf wordpress-6.8.1.tar.gz
mv wordpress/* /var/www/wordpress/
mv wp-config.php /var/www/wordpress/
mv www.conf $(find /etc/php/ -type f -name www.conf)
rm -rf wordpress wordpress-6.8.1.tar.gz
mkdir -p /run/php
$(find /usr/sbin/ | grep php-fpm) -F

