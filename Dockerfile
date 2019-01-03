ARG UBUNTU_VERSION=latest

FROM ubuntu:$UBUNTU_VERSION

LABEL maintainer="acanewby@yahoo.com"
LABEL name="JDK on Ubuntu"
LABEL description="Provides a bare-bones container, based on Ubuntu and containing a defined version of JDK."

# Update OS package repo and install basic required packages
USER root
RUN apt-get update \
      && apt-get install -y wget

# General environment setup
ENV SCRATCH /scratch
WORKDIR ${SCRATCH}

#Install Oracle JDK
RUN wget --output-file /dev/null \
    https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz

WORKDIR /opt/java/jdk
RUN tar -xvzf ${SCRATCH}/openjdk-11.0.1_linux-x64_bin.tar.gz
RUN ln -s ./jdk-11.0.1/ 11

ENV JAVA_HOME /opt/java/jdk/11
ENV PATH ${JAVA_HOME}/bin:$PATH



# Standard start conditions
WORKDIR /home
CMD ["/bin/bash"]





