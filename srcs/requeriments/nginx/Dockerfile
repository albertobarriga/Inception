# syntax=docker/dockerfile:1

#the image is build with debian
FROM debian:bullseye

#we need to download apt, install nginx and ssl(to have the TLS)
RUN apt update && apt install -y nginx && apt install -y openssl

# create the folder to the certificates
RUN     mkdir -p /etc/nginx/ssl

#we generate the certificate
RUN openssl req -x509 -sha256 -nodes \
    -days 700 -newkey rsa:4096 \
    -out /etc/ssl/abarriga.crt \
    -keyout /etc/ssl/abarriga.key \
    -subj "/C=ES/ST=Espanya/L=Castello/O=42 School/OU=abarriga/CN=abarriga.42.fr"



COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD nginx -g "daemon off;"
