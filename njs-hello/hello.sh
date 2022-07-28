#!/bin/bash

function test_hello_world {
    body=$(curl http://localhost/)
    
    assertequals "$body" "Hello world!"
}