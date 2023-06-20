FROM debian:buster

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install vsftpd -y \
&& mkdir -p /var/www/html \
&& mkdir -p /var/run/vsftpd/empty

#dans le fichier conf, on a modifie :
#   1.chroot_local_user=yes pour interdire de descendre en dessous du dossier autorise, et ainsi eviter les copies de fichiers systemes
#   2.anonymous_enable=NO pour obliger l'authentification
COPY /conf/vsftpd.conf /etc/vsftpd.conf
COPY /tools/scriptftp.sh /tmp/scriptftp.sh

EXPOSE 21

CMD ["bash", "/tmp/scriptftp.sh"]


