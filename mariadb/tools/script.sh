#!/bin/bash



# MYSQL SETUP
db1_name=papafrita
db1_user=rata
db1_pwd=tete


# FTP SETUP
ftp_user=loscompadres
ftp_pwd=lanoria

# inicia el servivio de mysql
service mariadb start 

mysql -u root -p '$db1_pwd'
# crea una base de datos si no existe
mysql -e "CREATE DATABASE IF NOT EXISTS $db1_name ;"
# crea un usuario si no existe con una contraseña especifica
mysql -e "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;"
# da todos los privilegios en la base de datos de al usuario
mysql -e "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;"
# cambia la contraseña a "12345"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;"
# actualiza los privilegios
mysql -e "FLUSH PRIVILEGES;"
