FROM debian:11
RUN apt update && apt upgrade -y && apt install nginx -y && apt install -y openssl netcat
RUN rm -rf /etc/nginx/sites-enabled/default
COPY tools/start_nginx.sh /
RUN chmod +x /start_nginx.sh
COPY conf/wordpress.conf /etc/nginx/sites-enabled/
RUN openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem -sha256 -days 365 -subj "/C=MA/CN=localhost"
CMD ["/start_nginx.sh"]
