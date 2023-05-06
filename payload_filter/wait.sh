#!/bin/sh

function waiting {
    ready=0
    while [ "$ready" -eq "0" ]
    do    
        ready=`curl http://localhost:$2 | grep "$3" | wc -l`
        if [ "$ready" -eq "0" ]; then    
            echo "Waiting for $1 on port $2 to answer $3"
            sleep 1;
        fi
    done;
    echo "$1 is ready on port $2";
}

waiting good 5015 "matching"
waiting nope 5066 "not matching"
waiting nginx 8080/ping "pong"