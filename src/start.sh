#!/bin/bash

main() {
    docker-compose -f traefik/insecure/docker-compose.yml up -d
    docker-compose -f nginx-php-site/docker-compose.yml up -d
    docker-compose -f mysql/docker-compose.yml up -d
}

main
