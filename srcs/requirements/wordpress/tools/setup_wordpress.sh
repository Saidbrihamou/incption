#!/bin/bash

MYSQL_PASS=$(cat /run/secrets/db_password)
WP_ADMIN_PASS=$(cat /run/secrets/wp_password)

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
cp wp-cli.phar /usr/local/bin/wp
cp www.conf $(find /etc/php/ -type f -name www.conf)

until mysqladmin ping --host=mariadb -u $MYSQL_USER -p"$MYSQL_PASS" --silent ;
do
	echo " ⏳ WordPress Waiting for  MariaDB ...."
	sleep 1
done 

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp core download --path=/var/www/wordpress/ --allow-root
	wp config create --dbname=$MYSQL_WORDPRESS --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASS --dbhost=$DB__HOST \
		--path=/var/www/wordpress --allow-root --extra-php << EOF
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'redis');
EOF

fi

if ! wp core is-installed  --path=/var/www/wordpress --allow-root; then
	wp core install --url=https://$DOMIN_NAME --title=goodinstall --admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL \
		--path=/var/www/wordpress --allow-root 
fi

mkdir -p /run/php
chown -R www-data:www-data /var/www/wordpress
chmod -R 774 /var/www/wordpress


wp plugin install redis-cache --activate --path=/var/www/wordpress --allow-root
wp redis enable --path=/var/www/wordpress --allow-root


exec $(find /usr/sbin/ | grep php-fpm) -F
