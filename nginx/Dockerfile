FROM debian:buster

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install nginx -y

RUN apt-get install nano -y

RUN mkdir -p /etc/nginx/ssl

RUN apt-get install openssl -y