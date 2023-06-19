FROM debian:buster

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install mariadb-server -y 

#copie fichier configuration mariadb server
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#changement droits sur le dossier de stockage BDD
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld 
RUN chmod 777 /var/run/mysqld

#exposition du port 3306
EXPOSE 3306

COPY /tools/script.sh /tmp/script.sh

#execution du script
ENTRYPOINT ["bash", "/tmp/script.sh"]
