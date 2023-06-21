FROM debian:buster

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install nodejs -y \
&& mkdir -p /var/www/html

COPY /conf/nico.html /var/www/html/nico.html
COPY /conf/secret.html /var/www/html/secret.html
COPY /conf/example.js /tmp/example.js

EXPOSE 1111

CMD ["node", "/tmp/example.js"]

