#!/bin/bash

function test_when_not_matching {
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'this body will be ignored' http://localhost)
    
    assertequals "$body" "not matching"
}

function test_when_matching {
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'we want this one' http://localhost)
    
    assertequals "$body" "matching"
}

function test_several_entries_can_be_matching {
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'we want that     too' http://localhost)
    
    assertequals "$body" "matching"
}