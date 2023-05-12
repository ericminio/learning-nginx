#!/bin/bash

function test_proxy_pass {
    body=$(curl http://localhost:8080/api/ping)
    
    assertequals "$body" "you called /ping"
}