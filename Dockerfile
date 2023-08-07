FROM ubuntu:latest

RUN apt update && apt install -y maven nodejs npm

COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/
