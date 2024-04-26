#!/bin/bash

source ../support/nginx/reload.sh
source ../support/utils.sh

function test_json_header {
    nginx_reload_configuration
    type=$(curl --head http://localhost:8080/ping | grep "Content-Type:" | trim)
    
    assertequals "$type" "Content-Type: application/json"
}

function test_json_content {
    nginx_reload_configuration
    body=$(curl http://localhost:8080/alive | json) 
    
    
    assertequals "$body" '{ "alive":true, "value":42 }'
}

function test_several_endpoints {
    nginx_reload_configuration
    body=$(curl http://localhost:8080/set | json) 
    
    
    assertequals "$body" '{ "heroes":[{ "name":"Batman", "actually":"Bruce" }, { "name":"Clark", "actually":"Superman" }] }'
}

