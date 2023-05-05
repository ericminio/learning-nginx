#!/bin/bash

touch ../nginx/conf.d/matching

function nginx_reload_configuration {
    docker exec nginx nginx -s reload
    sleep 1
}

function test_defaults_to_not_matching_with_empty_matching_file {
    echo "" > ../nginx/conf.d/matching
    nginx_reload_configuration
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'this is fine' http://localhost)
    
    assertequals "$body" "not matching"
}

function test_matching_requires_configuration {
    echo "'~this one' 'matching';" > ../nginx/conf.d/matching
    nginx_reload_configuration
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'we want this one' http://localhost)
    
    assertequals "$body" "matching"
}

function test_matching_configuration_file_welcomes_several_entries {
    echo "'~this one' 'matching';" > ../nginx/conf.d/matching
    echo "'~that\s+too' 'matching';" >> ../nginx/conf.d/matching
    nginx_reload_configuration
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'we want that     too' http://localhost)
    
    assertequals "$body" "matching"
}

function test_not_matching_can_also_be_configured {
    echo "'~maybe' 'not_matching';" > ../nginx/conf.d/matching
    nginx_reload_configuration
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'maybe' http://localhost)
    
    assertequals "$body" "not matching"
}
