#!/bin/bash

function test_get_body_can_be_proxied {
    body=$(curl --header "Content-Type: text/plain" --data 'can you see me?' http://localhost:8080)
    
    assertequals "$body" "can you see me? I can see you"
}
