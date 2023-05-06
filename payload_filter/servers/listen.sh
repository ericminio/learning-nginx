#!/bin/sh

echo "HTTP/1.1 200 OK" > /usr/local/src/answer
echo "Content-Type: text/html; charset=UTF-8" >> /usr/local/src/answer
echo "Server: netcat" >> /usr/local/src/answer
echo "" >> /usr/local/src/answer
echo "$PONG" >> /usr/local/src/answer
echo "" >> /usr/local/src/answer
answer=`cat /usr/local/src/answer`

echo "listening on port: $PORT"
echo "answering with:"
echo "$answer"

while true; 
do 
    printf "%s\n" "$answer" | nc -lp $PORT; 
done