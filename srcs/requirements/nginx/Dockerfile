FROM debian:11
RUN apt update && apt upgrade -y && apt install nginx -y && apt install -y openssl netcat
RUN rm -rf /etc/nginx/sites-enabled/default
COPY tools/start_nginx.sh /
RUN chmod +x /start_nginx.sh
COPY conf/wordpress.conf /etc/nginx/sites-enabled/
CMD ["/start_nginx.sh"]
