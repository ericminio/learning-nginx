#!/bin/bash

function test_echo_server_is_ready {
    body=$(curl --data "hello" http://localhost:5015)
    
    assertequals "$body" "echoing: hello"
}

function test_njs_module_can_modify_body {
    body=$(curl --data "detrevni" http://localhost:8080)
    
    assertequals "$body" "echoing: inverted"
}
