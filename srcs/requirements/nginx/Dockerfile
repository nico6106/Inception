FROM debian:buster

#installation nginx
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install nginx -y

#creation dossier ssl
RUN mkdir -p /etc/nginx/ssl

#installation OpenSSL pour TSLv1.2
RUN apt-get install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nlesage.42.fr/UID=nlesage"

#RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -addext "subjectAltName=DNS:nlesage.42.fr" -newkey rsa:4096 -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nlesage.42.fr/UID=nlesage"

#RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nlesage.42.fr/UID=nlesage"

#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nlesage.42.fr/UID=nlesage"

#creation  stockage fichier configuration
RUN mkdir -p /var/run/nginx

#copy du fichier de configuration dans notre conteneur
COPY /conf/nginx.conf /etc/nginx/nginx.conf
#COPY /conf/nginx.conf /etc/nginx/conf.d
#COPY /tools/index.html /var/www/html/index.html

#donne droit (tous droits au proprietaire + lecture et acces aux autres)
RUN chmod 755 /var/www/html
#/var/www/html 
#dossier

#modifie le proprietaire, option -R pour tous les sous s
RUN chown -R www-data:www-data /var/www/html
#dossier html

RUN echo "nginx OK"
#CMD ["echo", "nginx ok"]

EXPOSE	443

CMD [ "nginx", "-g", "daemon off;"]