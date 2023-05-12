#!/bin/bash

function test_proxy_set_header {
    body=$(curl http://localhost:8080/api/ping)
    
    assertequals "$body" "you called /ping with header x-answer:42"
}