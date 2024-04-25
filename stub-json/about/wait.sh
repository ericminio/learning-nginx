#!/bin/bash

docker exec nginx nginx -s reload

source ../support/wait.sh
waiting nginx 8080/ping "pong"