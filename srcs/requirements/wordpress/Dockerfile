FROM debian:buster

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install php7.3 php-fpm php-mysql -y \
&& apt-get install wget -y

RUN apt-get install mariadb-client -y 

RUN mkdir -p /var/www/html
#ici decommente
# RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz
# RUN chown -R root:root /var/www/wordpress

#configurer php
#COPY /conf/php.ini /etc/php/7.3/cli/php.ini

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#installation WP-CLI : telechargement archive + installation (changement en executable + deplacer dans dossier)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#RUN mkdir /var/www/ && mkdir /var/www/html 
#dossier

#COPY /conf/wp-config.php /var/www/wp-config.php

#RUN wp core download --allow-root
#RUN bash ./config_wpcli.sh


RUN mkdir /run/php

#RUN wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

#COPY /tools/config_wpcli.sh /var/www/wordpress/config_wpcli.sh
#ENTRYPOINT bash /var/www/wordpress/config_wpcli.sh


COPY /tools/config_wpcli.sh /tmp/config_wpcli.sh

# RUN sh ./config_wpcli.sh

RUN chmod 755 /var/www/html
#modifie le proprietaire, option -R pour tous les sous s
RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html/

#We expose the 9000 port
EXPOSE 9000


CMD ["sh", "/tmp/config_wpcli.sh"]
