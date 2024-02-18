ARG ARCH=amd64
FROM --platform=${ARCH} ubuntu:22.04

ENV HOME=/wd

RUN apt update \
    && apt clean 

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
