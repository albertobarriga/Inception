FROM debian:buster

RUN apt-get -y update && apt-get install -y wget curl php7.3 php-fpm php-mysql mariadb-client

COPY ./tools/php-fpm.conf /

COPY ./tools/ /



