# Leaner build then Ubunutu
FROM aespinosa/jenkins
MAINTAINER Mike Balmer <me@remlabm.com>

RUN apt-get update
RUN apt-get install -qy python-pip git
RUN pip uninstall -y requests
RUN pip install PyYAML requests==2.4.3 docker-compose==1.1.0-rc2

VOLUME ["/jenkins"]
