#!/bin/bash

source ../support/wait.sh

waiting good 5015 "matching"
waiting nope 5066 "not matching"
waiting nginx 8080/ping "pong"