#!/bin/bash

function test_ping {
    body=$(curl http://localhost:8080/ping)
    
    assertequals "$body" "pong"
}

function test_body_switch_one {
    body=$(curl --data "one" http://localhost:8080)
    
    assertequals "$body" "hello"
}

function test_body_switch_two {
    body=$(curl --data "two" http://localhost:8080)
    
    assertequals "$body" "world"
}
