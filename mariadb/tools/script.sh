#!/bin/bash



# MYSQL SETUP
db1_name=papitafrita
db1_user=ratatatta
db1_pwd=tete


# FTP SETUP
ftp_user=loscompadres
ftp_pwd=lanoria

# inicia el servivio de mysql
service mysql start 

# crea una base de datos si no existe
echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > db1.sql
# crea un usuario si no existe con una contraseña especifica
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> db1.sql
# da todos los privilegios en la base de datos de al usuario
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> db1.sql
# cambia la contraseña a "12345"
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
# actualiza los privilegios
echo "FLUSH PRIVILEGES;" >> db1.sql

# ejecuta comandos sql 
mysql < db1.sql

# detenemos el proceso de mysql
# kill $(cat /var/run/mysqld/mysqld.pid)

# iniciamos el servidor de mysql
# mysqld