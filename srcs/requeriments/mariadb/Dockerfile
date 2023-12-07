FROM debian:bullseye

# actualizo la lista de paquetes e instalo el servidor de mariadb
RUN apt-get -y update && apt-get install -y mariadb-server

# copia del archivo de configuracion
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/


COPY ./tools/script.sh /
COPY ./tools/.env /.env


EXPOSE 3306
CMD ["/script.sh"]

