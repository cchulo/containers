ARG ARCH=amd64
FROM --platform=${ARCH} ubuntu:22.04

ENV HOME=/wd
RUN mkdir /wd && touch /wd/.bashrc

RUN apt update \
    && apt install -y \
        sudo \
        curl \
    && apt clean

ARG NODE_VERSION=20
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
  sudo apt-get install -y nodejs \
  && apt clean

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
