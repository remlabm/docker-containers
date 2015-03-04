FROM aespinosa/jenkins
RUN apt-get update
#RUN apt-get install -qy python-pip git
#RUN pip uninstall -y requests
#RUN pip install PyYAML requests==2.4.3 docker-compose==1.1.0-rc2
#RUN pip install -U docker-compose==1.1.0-rc2

VOLUME [ "/jenkins"]

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y openjdk-7-jdk icedtea-netx git && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64


# Add user jenkins to the image
RUN adduser --quiet jenkins

ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 && apt-get clean

# Install Android SDK
RUN rm -rf /opt/android-sdk-linux
RUN cd /opt && wget --output-document=android-sdk.tgz --quiet http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz && tar xzf android-sdk.tgz && rm -f android-sdk.tgz && chown -R jenkins.jenkins android-sdk-linux

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Install sdk elements
COPY tools /opt/tools
ENV PATH ${PATH}:/opt/tools
RUN chmod +x /opt/tools/android-accept-licenses.sh

USER jenkins
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk --all --no-ui --filter platform-tools,tools,build-tools-21.1.2,android-21,addon-google_apis_x86-google-21,extra-android-support,extra-android-m2repository,extra-google-m2repository,sys-img-armeabi-v7a-android-21"]

RUN which adb
#RUN which android

USER root

RUN echo ANDROID_HOME="$ANDROID_HOME" >> /etc/environment