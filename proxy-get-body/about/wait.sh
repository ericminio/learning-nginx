#!/bin/bash

source ../support/wait.sh

waiting node 5015 "I can see you"
waiting nginx 8080/ping "pong"
