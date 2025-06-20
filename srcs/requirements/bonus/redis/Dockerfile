FROM debian:11
RUN apt update && apt upgrade -y && apt install redis-server -y
CMD ["redis-server", "--protected-mode", "no"]
