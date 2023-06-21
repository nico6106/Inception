FROM debian:buster

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install php7.3 php-fpm php-mysql wget -y \
&& mkdir -p /var/mysql

#on recupere adminer via son fichier github et on le renomme adminer.php
RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php"
RUN mv adminer-4.8.1.php adminer.php

EXPOSE 8000

#lancement du service php avec le port 8000
CMD ["php", "-S", "0.0.0.0:8000"]
