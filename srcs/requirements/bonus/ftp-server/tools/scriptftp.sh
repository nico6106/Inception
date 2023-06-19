
cd /tmp
if [ -f ./done ]
then
    echo "ftp already installed"
else
    touch done
    
    adduser $FTP_USR --disabled-password
    echo "$FTP_USR:$FTP_PWD" | chpasswd

    chown -R $FTP_USR:$FTP_USR /var/www/html

    echo $FTP_USR > /etc/vsftpd.userlist
fi

vsftpd /etc/vsftpd.conf