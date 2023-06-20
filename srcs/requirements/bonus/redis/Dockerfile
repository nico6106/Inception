FROM debian:buster

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install redis-server -y

#dans le fichier conf, on a modifie 3 elements:
#   1.retirer bind=127.0.0.1
#   2.ajout maxmemory 256mb : memoire max du cache
#   3.maxmemory-policy allkeys-lru : 
COPY /conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "--protected-mode no"]
