FROM debian:11
RUN apt update && apt upgrade -y && apt install python3 python3-pip -y
RUN pip3 install glances[all]
CMD [ "glances", "-w" ]

