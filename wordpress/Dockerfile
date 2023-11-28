FROM debian:bullseye

RUN apt-get -y update && apt-get install -y wget curl php8.2 php-fpm php-mysql mariadb-client



RUN wget https://es.wordpress.org/wordpress-6.4.1-es_ES.tar.gz -P /var/www && \
    cd /var/www && tar -xzf wordpress-6.4.1-es_ES.tar.gz && rm wordpress-6.4.1-es_ES.tar.gz

COPY ./conf/php-fpm.conf /etc/php/8.2/fpm/pool.d

COPY ./tools/script.sh /

RUN chmod +x /script.sh

RUN addgroup -S wp_group && adduser -S abarriga wp_group

CMD  ["/script.sh"]