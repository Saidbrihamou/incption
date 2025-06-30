FROM debian:11
RUN apt update && apt upgrade -y && apt install nginx -y
COPY xo/* /var/www/html/
CMD ["nginx", "-g" ,"daemon off;"]