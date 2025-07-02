#!/bin/bash

useradd -m $FTP_USER_NAME
<<EOF cat | passwd $FTP_USER_NAME
$FTP_USER_PASS
$FTP_USER_PASS
EOF

chmod -R 774 /var/data/ftp
usermod -aG www-data $FTP_USER_NAME
exec "vsftpd" "/etc/vsftpd.conf"
