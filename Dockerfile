FROM nginx

COPY ./config/default.conf /etc/nginx/conf.d/default.conf

COPY content /usr/share/nginx/html