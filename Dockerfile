FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

ENV MAVEN_VERSION 3.9.4

RUN apt update && \
  apt install -y wget nodejs npm && \
  wget https://dlcdn.apache.org/maven/maven-${MAVEN_VERSION:0:1}/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
  tar xvfz apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt

ENV M2_HOME /opt/apache-maven-${MAVEN_VERSION}
ENV PATH ${PATH}:${M2_HOME}/bin

COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/

RUN npm install -g n && \
  n latest

RUN npm install -g npm
