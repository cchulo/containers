FROM ubuntu:22.04

ENV HOME=/wd

RUN mkdir -p $HOME \
    && touch /wd/.bashrc \
    && apt update \
    && apt install -y \
        sudo \
        curl \
        git \
        build-essential \
    && apt clean \
    && git clone https://github.com/radareorg/radare2 \
    && radare2/sys/install.sh

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
