#!/bin/bash

function test_defaults_to_not_matching_with_empty_matching_file {
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'random payload' http://localhost)
    
    assertequals "$body" "not matching"
}

function test_matching_requires_configuration {
    echo "'~this one' 'matching';" > ./body_based_proxy/nginx/conf.d/matching
    docker exec nginx nginx -s reload
    sleep 1
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'we want this one' http://localhost)
    
    assertequals "$body" "matching"
}

function test_matching_configuration_file_welcomes_several_entries {
    echo "'~this one' 'matching';" > ./body_based_proxy/nginx/conf.d/matching
    echo "'~that\s+too' 'matching';" >> ./body_based_proxy/nginx/conf.d/matching
    docker exec nginx nginx -s reload
    sleep 1
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'we want that     too' http://localhost)
    
    assertequals "$body" "matching"
}

function test_not_matching_can_also_be_configured {
    echo "'~maybe' 'not_matching';" > ./body_based_proxy/nginx/conf.d/matching
    docker exec nginx nginx -s reload
    sleep 1
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'maybe' http://localhost)
    
    assertequals "$body" "not matching"
}

function test_resists_empty_matching_file {
    echo "" > ./body_based_proxy/nginx/conf.d/matching
    docker exec nginx nginx -s reload
    sleep 1
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'this is fine' http://localhost)
    
    assertequals "$body" "not matching"
}

