ARG UBUNTU_VERSION=latest

FROM ubuntu:$UBUNTU_VERSION

LABEL maintainer="acanewby@yahoo.com"
LABEL name="JDK on Ubuntu"
LABEL description="Provides a bare-bones container, based on Ubuntu and containing a defioned version of JDK."

# Update OS package repo and install basic required packages
USER root
RUN apt-get update \
      && apt-get install -y wget

# General environment setup
ENV SCRATCH /scratch
WORKDIR ${SCRATCH}

#Install Oracle JDK
RUN wget --header "Cookie: oraclelicense=a" \
    --output-file /dev/null \
    https://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/jdk-8u192-linux-x64.tar.gz

WORKDIR /opt/java/jdk
RUN tar -xvzf ${SCRATCH}/jdk-8u192-linux-x64.tar.gz
RUN ln -s ./jdk1.8.0_192/ 8

ENV JAVA_HOME /opt/java/jdk/8
ENV PATH ${JAVA_HOME}/bin:$PATH



# Standard start conditions
WORKDIR /home
CMD ["/bin/bash"]





