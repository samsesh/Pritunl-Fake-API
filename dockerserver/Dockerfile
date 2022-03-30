FROM alpine:latest

#Label
LABEL maintainer="admin@samsesh.net"
LABEL version="0.1"
LABEL description="This is Docker Image for fake api server pritunl"

WORKDIR /var/www/html/

#update repo
RUN apk update

# Essentials
RUN echo "UTC" > /etc/timezone
RUN apk add --no-cache zip unzip curl sqlite nginx supervisor

#copy file
COPY ./www/* /var/www/html/

# Installing bash
RUN apk add bash
RUN sed -i 's/bin\/ash/bin\/bash/g' /etc/passwd

# Installing PHP
RUN apk add --no-cache php8 \
    php8-common \
    php8-fpm \
    php8-pdo \
    php8-opcache \
    php8-zip \
    php8-phar \
    php8-iconv \
    php8-cli \
    php8-curl \
    php8-openssl \
    php8-mbstring \
    php8-tokenizer \
    php8-fileinfo \
    php8-json \
    php8-xml \
    php8-xmlwriter \
    php8-simplexml \
    php8-dom \
    php8-pdo_mysql \
    php8-pdo_sqlite \
    php8-tokenizer \
    php8-pecl-redis

RUN ln -s /usr/bin/php8 /usr/bin/php
# Configure PHP
RUN mkdir -p /run/php/
RUN touch /run/php/php8.0-fpm.pid
COPY ./php-fpm.conf /etc/php8/php-fpm.conf
COPY ./php.ini-production /etc/php8/php.ini

# Configure supervisor
RUN mkdir -p /etc/supervisor.d/
COPY ./supervisord.ini /etc/supervisor.d/supervisord.ini

#Configure nginx
COPY ./nginx.conf /etc/nginx/

RUN mkdir -p /run/nginx/
RUN touch /run/nginx/nginx.pid

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN chmod -R 777 /var/www/html/
#RUN systemctl restart apache2
EXPOSE 80
CMD ["supervisord", "-c", "/etc/supervisor.d/supervisord.ini"]
