FROM --platform=linux/amd64 ubuntu:20.04

ENV HOME=/wd

RUN apt update \
    && apt install -y \
        mesa-utils \
        vulkan-tools \
    && apt clean 

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]

