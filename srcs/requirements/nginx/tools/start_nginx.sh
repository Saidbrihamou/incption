#!/bin/bash

## -nodes : NO password for the key
## -x509 self singed
openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem -sha256 -days 365 -subj "/C=MA/CN=localhost"
until nc -vz wordpress_php 9000 2> /dev/null; do
    echo "⏳ nginx Waiting for wordpress_php"
    sleep 1
done

exec "nginx" "-g" "daemon off;"