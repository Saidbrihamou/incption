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
clean:
	bash -c 'docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q); echo "successfully clean"' 2>/dev/null


docker stop $(docker ps -aq) && docker rm $(docker ps -aq)  # حذف الحاويات
docker rmi -f $(docker images -aq)                         # حذف الصور
docker volume rm $(docker volume ls -q)                    # حذف Volumes
docker network rm $(docker network ls -q)                  # حذف الشبكات
docker system prune -af --volumes                          # تنظيف نهائي