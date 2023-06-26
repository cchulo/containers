FROM --platform=linux/amd64 ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt update \
  && apt install -y \
  python3 \
  git \
  clang \
  gdb \
  cmake \
  make \
  ninja-build \
  libgl1-mesa-dev \
  libvulkan-dev \
  libglfw3-dev \
  libglm-dev \
  && apt clean \
  && git clone https://github.com/skaslev/gl3w \
  && cd gl3w \
  && python3 gl3w_gen.py \
  && cd ..

ENTRYPOINT [ "/bin/bash" ]

