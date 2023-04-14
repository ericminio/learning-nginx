#!/bin/bash

function test_when_not_matching {
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'unknown' http://localhost)
    
    assertequals "$body" "not matching"
}

function test_when_matching {
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'matching' http://localhost)
    
    assertequals "$body" "matching"
}