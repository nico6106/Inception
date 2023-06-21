FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install wget -y

#telechargement de cadvisor + changement droit acces pour qu'on puisse l'ouvrir depuis 127.0.0.1:8080
RUN wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor
RUN chmod +x cadvisor

EXPOSE 8080

#lancement de cadvisor
CMD ["./cadvisor"]
