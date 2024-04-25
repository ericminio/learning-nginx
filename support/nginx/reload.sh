#!/bin/bash

function nginx_reload_configuration {
    docker exec nginx nginx -s reload
    sleep 1
}
