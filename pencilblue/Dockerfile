FROM node
MAINTAINER Mike Balmer <me@remlabm.com>
ENV PB_SITE_NAME="My PencilBlue Site" \
    PB_SITE_ROOT="" \
    PB_SITE_PORT=8080 \
    PB_LOG_LEVEL="info" \
    PB_DB_TYPE="mongo" \
    PB_DB_NAME="pencilblue" \
    PB_REGISTRY_TYPE="mongo" \
    PB_SESSION_STORAGE="mongo"
RUN apt-get update && apt-get install -y \
        curl \
        git

RUN npm install -g \
        nodemon \
        pencilblue-cli \
    && mkdir /root/pb \
    && git clone https://github.com/pencilblue/pencilblue.git /root/pb \
    && cd /root/pb \
    #&& git checkout tags/0.5.0 \
    && npm install
ADD docker-entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]
WORKDIR /root/pb
EXPOSE 8080
CMD ["nodemon", "pencilblue"]