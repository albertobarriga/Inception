FROM debian:buster

# actualizo la lista de paquetes e instalo el servidor de mariadb
RUN apt-get -y update && apt-get install -y mariadb-server

# copia del archivo de configuracion
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/


COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["mysqld_safe"]