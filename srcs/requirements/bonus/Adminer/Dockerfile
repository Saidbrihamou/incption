FROM debian:11
WORKDIR /var/www/html
RUN apt update && apt upgrade -y && apt install -y wget apache2 php libapache2-mod-php php-mysql
RUN rm -rf index.html
RUN wget https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php -O index.php
CMD apachectl -D FOREGROUND