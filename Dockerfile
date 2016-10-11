FROM ubuntu

RUN apt-get install sudo git

RUN git clone https://github.com/andreicon/cryptonote-generator generator

COPY ./config.json /generator/config.json

RUN cd generator && ./install-dependencies.sh

RUN ./generator.sh

ENTRYPOINT /generator/generated_files/builds/spaga-linux/spagad
