FROM debian:11
RUN apt update && apt upgrade -y && apt install nginx -y
RUN rm -rf /etc/nginx/sites-enabled/default
COPY conf/wordpress.conf /etc/nginx/sites-enabled/
CMD ["nginx", "-g", "daemon off;"]
