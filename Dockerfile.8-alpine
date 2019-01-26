FROM alpine:latest

LABEL maintainer="acanewby@yahoo.com"
LABEL description="Provides a bare-bones container with a JDK"

# Update OS package repo and install basic required packages
RUN apk update && apk add curl bash

# General environment setup
ARG SCRATCH=/scratch

WORKDIR /opt/java/jdk

ARG ZULU_VER=8.34.0.1
ARG JDK_BUILD=8.0.201
ARG JDK_VER=8

ARG JDK_ARCHIVE=${SCRATCH}/jdk-${JDK_VER}.tar.gz

RUN mkdir -p ${SCRATCH} && \
    curl -L https://cdn.azul.com/zulu/bin/zulu${ZULU_VER}-ca-jdk${JDK_BUILD}-linux_musl_x64.tar.gz -o ${JDK_ARCHIVE} && \
    tar -xvzf ${JDK_ARCHIVE} && \
    ln -s ./zulu${ZULU_VER}-ca-jdk${JDK_BUILD}-linux_musl_x64 ${JDK_VER} && \
    rm -f ${JDK_ARCHIVE}


ENV JAVA_HOME /opt/java/jdk/$JDK_VER
ENV PATH ${JAVA_HOME}/bin:$PATH


# Standard start conditions
WORKDIR /home
CMD ["/bin/bash"]





