FROM debian:bullseye

RUN apt-get -y update && apt-get upgrade -y 
RUN apt-get install -y wget curl php7.4 php-fpm php-mysql mariadb-client


RUN wget https://es.wordpress.org/wordpress-6.4.1-es_ES.tar.gz -P /var/www && \
    cd /var/www && tar -xzf wordpress-6.4.1-es_ES.tar.gz && rm wordpress-6.4.1-es_ES.tar.gz

COPY conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm7.4


COPY tools/script.sh /

RUN chmod +x /script.sh

RUN useradd -m -s /bin/bash abarriga && groupadd castellon && usermod -aG castellon abarriga

EXPOSE 9000

CMD  ["/script.sh"]