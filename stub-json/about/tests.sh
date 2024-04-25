#!/bin/bash

source ../support/nginx/reload.sh

function test_json_header {
    nginx_reload_configuration
    type=$(curl --head http://localhost:8080/json | grep "Content-Type:")
    trimmed=$(echo "$type" | sed 's/\r//g' | xargs echo -n)
    
    assertequals "$trimmed" "Content-Type: application/json"
}
