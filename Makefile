

clean:
	bash -c "docker rmi $(docker images -q) ; docker rm $(docker container ls -a -q)"