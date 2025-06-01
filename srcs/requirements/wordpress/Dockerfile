FROM debian:11
WORKDIR /wordpress
WORKDIR /mytemp
RUN apt update && apt upgrade -y && apt install wget -y && apt install tar -y
RUN apt install php-fpm php -y
COPY conf/wp-config.php .
COPY tools/setup_wordpress.sh .
COPY conf/www.conf .
RUN chmod +x setup_wordpress.sh
CMD ["/mytemp/setup_wordpress.sh"]

