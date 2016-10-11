FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get install -y sudo git

RUN git clone https://github.com/andreicon/cryptonote-generator generator

COPY ./config.json /generator/config.json

RUN cd /generator && chmod +x ./install_dependencies.sh && ./install_dependencies.sh

RUN cd /generator && chmod +x ./generator.sh && bash generator.sh

ENV DEBIAN_FRONTEND newt

ENTRYPOINT /generator/generated_files/builds/spaga-linux/spagad
