FROM nginx

# RUN apt-get update && apt-get install -y vim

COPY start.sh /usr/local/src/nginx/start.sh
RUN chmod +x /usr/local/src/nginx/start.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/hello.conf /etc/nginx/conf.d/default.conf
COPY njs/hello.js /etc/nginx/njs/hello.js

CMD ["/usr/local/src/nginx/start.sh"]