FROM remlabm/jenkins-slave


RUN apt-get update && apt-get install -y software-properties-common && \
    echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y apt-transport-https ca-certificates curl lxc iptables && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN curl -sSL https://get.docker.com/ubuntu/ | sh

# Install the magic wrapper.
RUN mkdir /etc/service/wrapdocker
ADD wrapdocker.sh /etc/service/wrapdocker/run
RUN chmod +x /etc/service/wrapdocker/run

VOLUME ["/jenkins", "/var/lib/docker"]
