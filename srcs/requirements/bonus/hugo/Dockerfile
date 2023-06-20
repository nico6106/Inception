FROM debian:buster

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install hugo git-all -y \
&& mkdir -p /var/www/

COPY /tools/config_hugo.sh /config_hugo.sh

EXPOSE 1313

RUN bash ./config_hugo.sh

WORKDIR /var/www/quickstart/

COPY /conf/config.toml /var/www/quickstart/config.toml

CMD ["hugo", "server", "--bind=0.0.0.0", "--baseURL=https://nlesage.42.fr", "-p", "1313", "--logFile=/dev/stdout", "--appendPort=false"]
