FROM remlabm/jenkins-slave


RUN apt-get update && apt-get install -y software-properties-common && \
    echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y openjdk-7-jdk icedtea-netx && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

# Install Android SDK
RUN rm -rf /opt/android-sdk-linux
RUN cd /opt && wget --output-document=android-sdk.tgz --quiet http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz && tar xzf android-sdk.tgz && rm -f android-sdk.tgz && chown -R jenkins.jenkins android-sdk-linux

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN echo ANDROID_HOME="$ANDROID_HOME" >> /etc/environment

# Install sdk elements
#ADD ./bin /usr/local/bin
#RUN chmod a+x /usr/local/bin/*

RUN android update sdk --all --no-ui -s --filter platform-tools,tools,build-tools-21.1.2,android-21,addon-google_apis_x86-google-21,extra-android-support,extra-android-m2repository,extra-google-m2repository,sys-img-armeabi-v7a-android-21

VOLUME ["/jenkins"]

