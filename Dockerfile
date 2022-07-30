FROM nginx

COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf

COPY content /usr/share/nginx/html