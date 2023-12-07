#!/bin/bash

# a esperas de tener el docker compose y poder quitarlo de aquí
# DB_USER=abarriga
# DB_USER2=user2
# DB_PASSWORD="12345"
# DB_PASSWORD2="12345"
# DB_NAME=wordpress
# DB_HOST=mariadb
# DB_EMAIL=abarriga@studen.42malaga.com
# DB_EMAIL2=user2@studen.42malaga.com
# URL=abarriga.42.fr
# inicia el servivio de mysql

service mariadb start 

# service mysql start 

# Espera a que el servidor MySQL esté disponible
# until mysqladmin ping -h"$DB_HOST" --silent; do
#   echo "Esperando a que el servidor MySQL esté disponible..."
#   sleep 1
# done

mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER@wordpress.srcs_incetion' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "ALTER USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# mysqld_safe

tail -f /dev/null