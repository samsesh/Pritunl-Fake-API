FROM php:7.4-apache
LABEL maintainer="admin@samsesh.net"
LABEL version="0.1"
LABEL description="This is Docker Image for fake api server pritunl"
COPY ./www/* /var/www/html/
RUN chown www-data:www-data  -R /var/www/html
RUN chmod -R 774 /var/www/html/
#RUN systemctl restart apache2
EXPOSE 80
