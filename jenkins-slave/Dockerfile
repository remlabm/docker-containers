FROM phusion/baseimage:latest

ENV HOME /root
WORKDIR /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y software-properties-common && \
    echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y git wget oracle-java7-installer && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /var/cache/oracle-jdk7-installer

RUN adduser --quiet jenkins
RUN echo "jenkins:jenkins" | chpasswd
RUN echo 'root:jenkins' | chpasswd

RUN mkdir /etc/service/jenkins-slave
ADD jenkins-slave.sh /etc/service/jenkins-slave/run
RUN chmod +x /etc/service/jenkins-slave/run

VOLUME ["/jenkins"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

