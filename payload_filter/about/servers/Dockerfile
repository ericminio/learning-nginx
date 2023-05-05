FROM alpine:3.9.5

RUN apk update && apk add \
    bash

COPY listen /usr/local/src/listen.sh
RUN chmod +x /usr/local/src/listen.sh

CMD ["/usr/local/src/listen.sh"]