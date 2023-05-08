FROM alpine:3.9.5

COPY pong.sh /usr/local/src/pong.sh
RUN chmod +x /usr/local/src/pong.sh

CMD ["sh", "-c", "source /usr/local/src/pong.sh && pong_server_listen"]