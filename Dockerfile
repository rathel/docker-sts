FROM ubuntu:focal

LABEL maintainer="Tim<rathel@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
      apt update; apt dist-upgrade -y && \
      apt install wine -y && \
      mkdir /opt/server

WORKDIR /opt/server

COPY server.exe /opt/server
COPY libcrypto-1_1-x64.dll /opt/server

EXPOSE 10578/udp

ENTRYPOINT ["wine", "server.exe"]
