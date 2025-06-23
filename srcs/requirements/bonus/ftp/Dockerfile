FROM debian:11
RUN apt update && apt upgrade -y && apt install vsftpd -y
COPY conf/vsftpd.conf /etc/vsftpd.conf
RUN mkdir -p /var/run/vsftpd/empty && mkdir -p /var/data/ftp
CMD ["vsftpd"]
