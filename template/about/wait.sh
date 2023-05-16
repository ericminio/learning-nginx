#!/bin/bash

docker exec nginx nginx -s reload

source ../support/wait.sh
waiting pong 5015 "hello"
waiting pong 5016 "world"
waiting nginx 8080/ping "pong"