FROM ubuntu:22.04

ENV HOME=/wd
ENV GOPATH=$HOME/go
ENV PATH=$GOPATH/bin:$PATH

RUN mkdir -p /wd \
    && mkdir -p $GOPATH/src $GOPATH/pkg $GOPATH/bin \
    && touch /wd/.bashrc \
    && apt update \
    && apt install -y \
        sudo \
        curl \
        golang-go \
    && apt clean

WORKDIR $GOPATH

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
