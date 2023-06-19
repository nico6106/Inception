FROM debian:buster

#installation nginx
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install nginx -y

#creation dossier ssl
RUN mkdir -p /etc/nginx/ssl

#installation OpenSSL pour TSLv1.2
RUN apt-get install openssl -y

#creation certicats :
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nlesage.42.fr/UID=nlesage"

#creation  stockage fichier configuration
RUN mkdir -p /var/run/nginx

#copy du fichier de configuration dans notre conteneur
COPY /conf/nginx.conf /etc/nginx/nginx.conf

#donne droit (tous droits au proprietaire + lecture et acces aux autres)
RUN chmod 755 /var/www/html

#modifie le proprietaire, option -R pour tous les sous s
RUN chown -R www-data:www-data /var/www/html

EXPOSE	443

#demarre nginx
CMD [ "nginx", "-g", "daemon off;"]