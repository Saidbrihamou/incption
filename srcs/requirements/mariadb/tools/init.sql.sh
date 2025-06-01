#!/bin/bash
service mariadb start
sleep 5

<<EOF cat | mariadb
ALTER USER 'root'@'localhost' IDENTIFIED BY "$MYSQL_PASS_ROOT";
RENAME USER 'root'@'localhost' TO "$MYSQL_NAME_ROOT"@'localhost';
CREATE DATABASE $MYSQL_WORDPRESS;
CREATE USER '$MYSQL_USER'@'wordpress_php' IDENTIFIED BY '$MYSQL_PASS';
GRANT ALL PRIVILEGES ON $MYSQL_WORDPRESS.* TO '$MYSQL_USER'@'wordpress_php';
FLUSH PRIVILEGES; 
EOF
sleep 100000
#exec mysqld_safe
