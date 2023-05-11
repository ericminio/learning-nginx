#!/bin/bash

function test_njs_module_is_ready {
    body=$(curl http://localhost:8080)
    
    assertequals "$body" "Hello World"
}
