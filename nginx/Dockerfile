# syntax=docker/dockerfile:1

#the image is build with debian
FROM debian:buster

#we need to download apt, install nginx and ssl(to have the TLS)
RUN apt update && apt install -y nginx && apt install -y openssl

#we generate the certificate
RUN openssl req -x509 -sha256 -nodes \
    -days 700 -newkey rsa:4096 \
    -out /etc/ssl/certs/abarriga.crt \
    -keyout /etc/ssl/private/abarriga.key \
    -subj "/C=ES/ST=Espanya/L=Castello/O=42 School/OU=abarriga/CN=abarriga.42.fr"



COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD nginx -g "daemon off;"
