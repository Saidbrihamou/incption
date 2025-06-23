#!/bin/bash

until nc -vz wordpress_php 9000 ; do
    echo "⏳ nginx Waiting for wordpress_php"
    sleep 1
done

exec "nginx" "-g" "daemon off;"