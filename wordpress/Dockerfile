FROM debian:bullseye

RUN apt-get -y update && apt-get upgrade -y 
RUN apt-get install -y wget curl php7.3 php-fpm php-mysql mariadb-client


RUN wget https://es.wordpress.org/wordpress-6.4.1-es_ES.tar.gz -P /var/www && \
    cd /var/www && tar -xzf wordpress-6.4.1-es_ES.tar.gz && rm wordpress-6.4.1-es_ES.tar.gz

COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/pool.d

COPY ./tools/script.sh /

RUN chmod +x /script.sh

#RUN addgroup  wp_group && adduser  abarriga wp_group
RUN useradd -m -s /bin/bash wpuser && groupadd wpgroup && usermod -aG wpgroup wpuser


CMD  ["/script.sh"]