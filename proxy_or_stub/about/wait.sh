#!/bin/bash

source ../support/wait.sh

waiting nginx 8080/ping "pong"
waiting upstream 5015 "you called /"
