PATH_C=srcs/docker-compose.yml

all:
	mkdir -p /home/sbrihamo/data/mariadb
	mkdir -p /home/sbrihamo/data/wordpress
	docker compose -f ${PATH_C} up
down:

	docker compose -f ${PATH_C} down
fclean:
	bash -c 'docker rmi $\(docker images -q) ; docker rm $\(docker container ls -a -q)'
