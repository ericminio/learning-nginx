#!/bin/sh

function tryit {
    echo "$1 is ready on port $2 ?";
    curl http://localhost:$2 | grep "$3" | wc -l
}

tryit good 5015 "matching"
tryit nope 5066 "not matching"
tryit nginx 8080/ping "pong"