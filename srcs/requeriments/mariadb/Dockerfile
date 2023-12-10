FROM debian:bullseye

# actualizo la lista de paquetes e instalo el servidor de mariadb
RUN apt-get -y update && apt-get install -y mariadb-server


COPY ./tools/script.sh /
COPY ./tools/.env /.env
COPY ./tools/my.cnf /etc/mysql/my.cnf

RUN chmod +x /script.sh

EXPOSE 3306

CMD ["/script.sh"]

