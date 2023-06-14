FROM debian:buster



RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install mariadb-server -y 
#mariadb-client

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY /conf/50-client.cnf /etc/mysql/mariadb.conf.d/50-client.cnf
#COPY /conf/my.cnf /etc/mysql/my.cnf
#COPY /conf/50-mysqld_safe.cnf /etc/mysql/mariadb.conf.d/50-mysqld_safe.cnf
#COPY /conf/debian.cnf /etc/mysql/debian.cnf

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld 
RUN chmod 777 /var/run/mysqld

EXPOSE 3306

COPY /tools/script.sh /tmp/script.sh

#CMD /usr/bin/mysqld_safe

ENTRYPOINT ["bash", "/tmp/script.sh"]

#CMD /usr/bin/mysqld_safe