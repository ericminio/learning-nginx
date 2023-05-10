#!/bin/bash

function test_can_proxy_get_payload {
    body=$(curl --header "Content-Type: text/plain" --request GET --data 'can you see me?' http://localhost:8080)
    
    assertequals "$body" "GET: can you see me? I can see you"
}
