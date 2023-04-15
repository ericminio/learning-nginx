#!/bin/bash

function test_matching {
    echo "'~this one' 'matching';" > ./body_based_proxy/nginx/conf.d/matching
    docker exec -it nginx nginx -s reload
    sleep 1
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'we want this one' http://localhost)
    
    assertequals "$body" "matching"
}

function test_matching_file_welcomes_several_entries {
    echo "'~this one' 'matching';" > ./body_based_proxy/nginx/conf.d/matching
    echo "'~that\s+too' 'matching';" >> ./body_based_proxy/nginx/conf.d/matching
    docker exec -it nginx nginx -s reload
    sleep 1
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'we want that     too' http://localhost)
    
    assertequals "$body" "matching"
}

function test_not_matching {
    echo "'~maybe' 'matching';" > ./body_based_proxy/nginx/conf.d/matching
    docker exec -it nginx nginx -s reload
    sleep 1
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'but no' http://localhost)
    
    assertequals "$body" "not matching"
}

function test_resists_empty_matching_file {
    echo "" > ./body_based_proxy/nginx/conf.d/matching
    docker exec -it nginx nginx -s reload
    sleep 1
    body=$(curl --header "Content-Type: text/plain" --request POST --data 'this is fine' http://localhost)
    
    assertequals "$body" "not matching"
}
