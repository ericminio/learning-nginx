#!/bin/sh

length=`echo "$PONG" | wc -c`

file=/usr/local/src/answer
echo "HTTP/1.1 200 OK" > $file
echo "Content-Type: text/plain; charset=UTF-8" >> $file
echo "Content-Length: $length" >> $file
echo "Server: netcat" >> $file
echo "" >> $file
echo "$PONG" >> $file
echo "" >> $file

answer=`cat $file`
echo "listening on port: $PORT"
echo "answering with:"
echo "$answer"
echo ""

while true; 
do 
    echo "$answer" | nc -lp $PORT; 
done