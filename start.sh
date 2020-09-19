#!/bin/bash

docker-compose -f src/traefik/insecure/docker-compose.yml up -d
docker-compose -f src/nginx-php-site/docker-compose.yml up -d
docker-compose -f src/mysql/docker-compose.yml up -d
