FROM debian:buster

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install nodejs -y \
&& mkdir -p /var/www/html/static

COPY /conf/nico.html /var/www/html/static/nico.html
COPY /conf/secret.html /var/www/html/static/secret.html
COPY /conf/example.js /tmp/example.js

#COPY /tools/script_site.sh /tmp/script_site.sh
#RUN bash /tmp/script_site.sh

EXPOSE 1111

CMD ["node", "/tmp/example.js"]

