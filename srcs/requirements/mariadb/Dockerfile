FROM debian:11
RUN apt update && apt upgrade -y && apt install mariadb-server -y
COPY /tools/init.sql.sh /init.sql.sh
RUN chmod +x /init.sql.sh
RUN service mariadb start && sleep 5 && init.sql.sh | mariadb
RUN rm -rf init.sql
CMD ["bash"]


