FROM nginx:1.9

COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/letsencrypt/geerydev.com

# SSL certs mounted at runtime
