#!/bin/bash

message=(
    "HTTP/1.1 200 OK"
    "Content-Type: text/html; charset=UTF-8"
    "Server: netcat"
    ""
    "$PONG"
    ""
)    

echo "listening on port: $PORT"
echo "answering with: $PONG"

while true; 
do 
    printf "%s\n" "${message[@]}" | nc -lp $PORT; 
done