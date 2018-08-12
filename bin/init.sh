#!/usr/bin/env bash

#docker pull phpearth/php:7.2-apache

#docker pull bianjp/mariadb-alpine

docker build --tag lexusalex/bitrix-scratch .

docker run --name bitrix-scratch-db -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=bitrix-scratch -v /home/alex/docker/bitrix-scratch/mysql-data:/var/lib/mysql -d bianjp/mariadb-alpine

docker run --name bitrix-scratch --link bitrix-scratch-db -p 80:80 -d -v "$PWD":/var/www/localhost/htdocs lexusalex/bitrix-scratch

docker exec -ti bitrix-scratch sh -c "cd /var/www/localhost/htdocs && wget -P /var/www/localhost/htdocs/ https://www.1c-bitrix.ru/download/scripts/bitrixsetup.php && chmod 777 -R /var/www/localhost/htdocs"


