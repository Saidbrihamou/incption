FROM debian:11
RUN apt update && apt upgrade -y && apt install vsftpd -y
EXPOSE 21 10100-10110
COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/scriptftp.sh /scriptftp.sh
RUN chmod +x /scriptftp.sh
RUN mkdir -p /var/run/vsftpd/empty && mkdir -p /var/data/ftp
CMD ["/scriptftp.sh"]
