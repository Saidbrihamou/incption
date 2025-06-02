#!/bin/bash

mysqld_safe --skip-networking &
sleep 6
<<EOF cat | mariadb
ALTER USER 'root'@'localhost' IDENTIFIED BY "$MYSQL_PASS_ROOT";
RENAME USER 'root'@'localhost' TO "$MYSQL_NAME_ROOT"@'localhost';
CREATE DATABASE $MYSQL_WORDPRESS;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';
GRANT ALL PRIVILEGES ON $MYSQL_WORDPRESS.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES; 
EOF
mysqladmin -u "$MYSQL_NAME_ROOT" -p"$MYSQL_PASS_ROOT" shutdown

#mysqladmin shutdown
exec mysqld_safe
