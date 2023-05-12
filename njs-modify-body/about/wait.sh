#!/bin/bash

source ../support/wait.sh

waiting nginx 8080/ping "pong"
waiting node 5015 "echoing:"
