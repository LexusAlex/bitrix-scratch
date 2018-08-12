#!/usr/bin/env bash

docker exec -ti bitrix-scratch sh -c "cd /var/www/localhost/htdocs && vendor/bin/phpunit"
