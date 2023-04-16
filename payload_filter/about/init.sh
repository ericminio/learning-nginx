#!/bin/bash

source ./reload-nginx.sh

touch ../nginx/conf.d/matching
docker-compose up --build -d
nginx_reload_configuration
