#!/bin/bash

source ../support/nginx/reload.sh
source ../support/trim.sh

function test_json_header {
    nginx_reload_configuration
    type=$(curl --head http://localhost:8080/json | grep "Content-Type:" | trim)
    
    assertequals "$type" "Content-Type: application/json"
}

function test_json_content {
    nginx_reload_configuration
    body=$(curl http://localhost:8080/json)
    
    assertequals "$body" "{\"alive\":true}"
}
