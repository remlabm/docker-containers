#FROM jrcs/nginx-proxy-letsencrypt
FROM jwilder/nginx-proxy

RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 0;'; \
      echo 'send_timeout 900;';\
      echo 'proxy_connect_timeout 900;';\
      echo 'proxy_send_timeout 900;';\
      echo 'proxy_read_timeout 900;';\
    } > /etc/nginx/conf.d/my_proxy.conf