#!/bin/bash

function test_ping {
    body=$(curl http://localhost:8080/ping)
    
    assertequals "$body" "pong"
}

function test_env_var_can_be_used_in_body {
    body=$(curl http://localhost:8080/body)
    
    assertequals "$body" "hello world"
}

