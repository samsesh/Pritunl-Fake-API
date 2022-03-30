#Download base image ubuntu 20.04
FROM ubuntu/apache2
LABEL maintainer="admin@samsesh.net"
LABEL version="0.1"
LABEL description="This is Docker Image for fake api server pritunl"
RUN apt-get update
RUN apt -y install lsb-release apt-transport-https ca-certificates wget
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update
#RUN apt-get install apache2 -y
RUN apt-get -y install php7.4-mysql php7.4-curl php7.4-gd php7.4-intl php-pear php-imagick php7.4-imap php-memcache
RUN apt-get install -y certbot
RUN certbot -d $(curl -s https://api.ipify.org/?format=text)
RUN apache2ctl -M
COPY ./www/* /var/www/html/
RUN chown www-data:www-data  -R /var/www/html
RUN chmod -R 774 /var/www/html/
RUN systemctl restart apache2
EXPOSE 80
