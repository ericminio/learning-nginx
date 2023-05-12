#!/bin/bash

function test_hello_world {
    body=$(curl http://localhost:8080/)
    
    assertequals "$body" "Hello world!"
}