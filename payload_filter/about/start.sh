#!/bin/bash

function start_servers {
    docker-compose up --build -d
    sleep 3
    nginx_reload_configuration
}
