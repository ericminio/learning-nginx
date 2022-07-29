#!/bin/bash

function test_proxy_is_default {
    body=$(curl http://localhost/api/1)
    
    assertequals "$body" "you called /api/1"
}

function test_proxy_is_default_also_with_not_matching_body {
    body=$(curl --header "Content-Type: text/plain" --request POST --data '15' http://localhost/api/2)
    
    assertequals "$body" "you called /api/2"
}

function test_stub_kicks_in_with_matching_body {
    body=$(curl --header "Content-Type: text/plain" --request POST --data '42' http://localhost/api/3)
    
    assertequals "$body" "42 I see u"
}