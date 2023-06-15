HOME		 	= /home/nlesage
COMPOSE			= sudo docker compose
COMPOSE_FILE	=./srcs/docker-compose.yml

all: volumes
	${COMPOSE} -f ${COMPOSE_FILE} -d up --pull never

volumes:
	sudo mkdir -p ${HOME}/data/db_volume
	sudo mkdir -p ${HOME}/data/wordpress_volume

build: volumes
	${COMPOSE} -f ${COMPOSE_FILE} build

log: volumes
	${COMPOSE} -f ${COMPOSE_FILE} up --pull never

ps:
	${COMPOSE} -f ${COMPOSE_FILE} ps

stop:
	${COMPOSE} -f ${COMPOSE_FILE} stop

down: 
	${COMPOSE} -f ${COMPOSE_FILE} down -v

clean: down
	sudo docker system prune -f -a --volumes

fclean: clean
	sudo rm -rf /home/nlesage/data

re: clean all

