FROM ubuntu:22.04

ENV HOME=/wd
RUN mkdir /wd && touch /wd/.bashrc

RUN apt update \
    && apt install -y \
        sudo \
        curl \
        golang-go \
    && apt clean

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
