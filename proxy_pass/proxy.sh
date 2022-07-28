#!/bin/bash

function test_proxy_pass {
    body=$(curl http://localhost/api/ping)
    
    assertequals "$body" "you called /ping"
}