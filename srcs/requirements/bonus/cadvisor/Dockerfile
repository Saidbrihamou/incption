FROM debian:11
RUN apt update && apt upgrade -y && apt install wget -y 
EXPOSE 61208
RUN wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 -O cadvisor
RUN chmod +x cadvisor
CMD [ "./cadvisor" ]

