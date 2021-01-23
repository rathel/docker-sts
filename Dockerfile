FROM alpine:3.13

LABEL maintainer="Tim<rathel@gmail.com>"

RUN  apk update && \
       apk add wine &&\
       mkdir /opt/server

WORKDIR /opt/server

COPY server.exe /opt/server
COPY libcrypto-1_1-x64.dll /opt/server

EXPOSE 10578/udp

ENTRYPOINT ["wine64", "server.exe"]
