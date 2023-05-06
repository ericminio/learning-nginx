#!/bin/sh

echo "good ready?"
curl http://localhost:5015 

echo "nope ready?"
curl http://localhost:5066 

echo "nginx ready?"
curl http://localhost:8080/ping