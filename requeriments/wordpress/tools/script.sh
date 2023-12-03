#!/bin/bash

DB_USER=abarriga
DB_USER2=user2
DB_PASSWORD="12345"
DB_PASSWORD2="12345"
DB_NAME=wordpress
DB_HOST=mariadb
DB_EMAIL=abarriga@studen.42malaga.com
DB_EMAIL2=user2@studen.42malaga.com
URL=abarriga.42.fr


WP_CONFIG_FILE="/var/www/wordpress/wp-config.php"
WP_CONFIG_SAMPLE="/var/www/wordpress/wp-config-sample.php"
WP_CLI_URL="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

if [[ ! -f $WP_CONFIG_FILE ]]; then
    # Descargar WP-CLI
    curl -o /usr/local/bin/wp $WP_CLI_URL
    chmod +x /usr/local/bin/wp

    # Copiar wp-config-sample.php a wp-config.php
    cp $WP_CONFIG_SAMPLE $WP_CONFIG_FILE

    # Configurar wp-config.php
    sed -i "s/password_here/$DB_PASSWORD/g" $WP_CONFIG_FILE
    sed -i "s/localhost/mariadb.srcs_inception/g" $WP_CONFIG_FILE
    sed -i "s/username_here/$DB_USER/g" $WP_CONFIG_FILE
    sed -i "s/database_name_here/$DB_NAME/g" $WP_CONFIG_FILE

    # Instalar WordPress
    wp core install --allow-root --url=$URL --title=$DB_USER \
        --admin_user=$DB_USER --admin_password=$DB_PASSWORD \
        --admin_email=$DB_EMAIL --path=/var/www/wordpress

    # Crear usuario adicional
    wp user create $DB_USER2 $DB_EMAIL2 --user_pass=$DB_PASSWORD2 \
        --role=author --allow-root --path=/var/www/wordpress
else
    echo "El archivo wp-config.php ya existe."
fi

# Iniciar el servidor PHP-FPM (usando la ruta completa)
/usr/sbin/php-fpm7.4 -y /etc/php/7.4/fpm/php-fpm7.4 -F