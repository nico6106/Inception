
cd /tmp
if [ -f ./done.empty ]
then
    echo "ftp already installed"
else
    touch done.empty
    
    #ajout utilisateur sans mdp
    adduser $FTP_USR --disabled-password

    #utilisation chpasswd pour changer mdp en masse avec user:pwd
    echo "$FTP_USR:$FTP_PWD" | chpasswd

    #changement de proprietaire du dossier pour eviter toute erreur possible
    chown -R $FTP_USR:$FTP_USR /home/nico
    chmod 777 /home/nico

    #ecrire non user dans fichier vsftpd.userlist qui est utilise par le fichier de config
    echo $FTP_USR > /etc/vsftpd.userlist
fi

vsftpd /etc/vsftpd.conf