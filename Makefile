PATH_C=srcs/docker-compose.yml

all:
	mkdir -p /home/sbrihamo/data/mariadb
	mkdir -p /home/sbrihamo/data/wordpress
	docker compose -f ${PATH_C} up
up:all

down:
	docker compose -f ${PATH_C} down
build:
	docker compose -f ${PATH_C} build 
# clean:
# 	docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null