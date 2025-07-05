#!/bin/bash

MYSQL_PASS_ROOT=$(cat /run/secrets/db_root_password)
MYSQL_PASS=$(cat /run/secrets/db_password)

chown -R mysql:mysql /var/lib/mysql
chmod 774 /var/lib/mysql

mysqld_safe --skip-networking &

until mysqladmin ping --silent ; do
	echo " ⏳ Waiting for  MariaDB ...."
	sleep 1
done

msgerror=$(mysqladmin ping -u $MYSQL_USER -p"$MYSQL_PASS" 2>&1  1> /dev/null)

if [ "$msgerror" != "" ]; then
echo " ❗️ start create users and database in mariadb"
<<EOF cat | mariadb && echo " ✅ create users and database in mariadb successfully ✅" || echo " ❌️ create users and database in mariadb failed ❌️"
ALTER USER 'root'@'localhost' IDENTIFIED BY "$MYSQL_PASS_ROOT";
RENAME USER 'root'@'localhost' TO "$MYSQL_NAME_ROOT"@'localhost';
CREATE DATABASE $MYSQL_WORDPRESS;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';
GRANT ALL PRIVILEGES ON $MYSQL_WORDPRESS.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

else
	echo " ✅ found users and database"
fi

mysqladmin -u "$MYSQL_NAME_ROOT" -p"$MYSQL_PASS_ROOT" shutdown

exec mysqld_safe
