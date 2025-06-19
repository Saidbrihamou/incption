FROM debian:11
RUN apt update && apt upgrade -y && apt install mariadb-server -y
COPY tools/init.sql.sh /init.sql.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY conf/my.cnf /etc/mysql/mariadb.conf/my.cnf
RUN chmod +x /init.sql.sh
CMD ["/init.sql.sh"]

