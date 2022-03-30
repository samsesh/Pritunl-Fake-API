#Download base image ubuntu 20.04
FROM ubuntu:20.04
LABEL maintainer="admin@samsesh.net"
LABEL version="0.1"
LABEL description="This is Docker Image for fake api server pritunl"
RUN sudo apt-get install apache2
RUN sudo apt-get -y install php7.4-mysql php7.4-curl php7.4-gd php7.4-intl php-pear php-imagick php7.4-imap php-memcache
RUN sudo apt-get install -y certbot
RUN sudo certbot -d $(curl -s https://api.ipify.org/?format=text)
RUN sudo apache2ctl -M
COPY ./www/* /var/www/html/
RUN sudo chown www-data:www-data  -R /var/www/html
RUN sudo chmod -R 774 /var/www/html/
RUN sudo systemctl restart apache2
EXPOSE 80
