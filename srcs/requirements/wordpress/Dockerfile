FROM debian:buster

#installation php7.3 + php-fpm
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install php7.3 php-fpm php-mysql -y \
&& apt-get install wget -y

#installation mariadb client (pour acceder DB sur conteneur mariadb)
RUN apt-get install mariadb-client -y 

#creation du dossier pour stockage site WP
RUN mkdir -p /var/www/html

#copie du fichier de configuration php (ou on a modifie le listen=wordpress:9000) 
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#installation WP-CLI : telechargement archive + installation (changement en executable + deplacer dans dossier)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#creation dossier php
RUN mkdir /run/php

#copy du script pour configurer wordpress
COPY /tools/config_wpcli.sh /tmp/config_wpcli.sh

#modification droit dossier stockage WP
RUN chmod 755 /var/www/html

#modifie le proprietaire, option -R pour tous les sous s
RUN chown -R www-data:www-data /var/www/html

#on travaille dans le dossier stockage WP
WORKDIR /var/www/html/

#We expose the 9000 port
EXPOSE 9000

CMD ["sh", "/tmp/config_wpcli.sh"]
