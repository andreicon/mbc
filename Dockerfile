FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y sudo git

RUN git clone https://github.com/andreicon/cryptonote-generator generator

COPY ./config.json /generator/config.json

RUN cd generator && ./install-dependencies.sh

RUN ./generator.sh

ENV DEBIAN_FRONTEND newt

ENTRYPOINT /generator/generated_files/builds/spaga-linux/spagad
