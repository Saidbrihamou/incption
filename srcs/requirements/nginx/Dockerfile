FROM debian:11
RUN apt update && apt upgrade -y && apt install nginx -y && apt install openssl -y
RUN rm -rf /etc/nginx/sites-enabled/default
COPY conf/wordpress.conf /etc/nginx/sites-enabled/
RUN openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem -sha256 -days 365 -subj "/C=MA/CN=localhost"
CMD ["nginx", "-g", "daemon off;"]
