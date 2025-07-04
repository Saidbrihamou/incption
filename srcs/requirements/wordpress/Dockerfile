FROM debian:11
WORKDIR /var/www/wordpress
WORKDIR /mytemp
RUN apt update && apt upgrade -y && apt install -y curl php-fpm php php-mysqli php-mysql php-pdo php-mbstring php-xml sendmail mariadb-client
COPY tools/setup_wordpress.sh .
COPY conf/www.conf .
RUN chmod +x setup_wordpress.sh
CMD ["/mytemp/setup_wordpress.sh"]
                          
