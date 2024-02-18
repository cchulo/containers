ARG ARCH=amd64
FROM --platform=${ARCH} ubuntu:20.04

ENV HOME=/wd
RUN mkdir /wd && touch /wd/.bashrc

RUN apt update \
    && apt install -y \
        mesa-utils \
        vulkan-tools \
    && apt clean 

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
