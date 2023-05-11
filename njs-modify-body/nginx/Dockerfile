FROM nginx

# RUN apt-get update && apt-get install -y vim

COPY start.sh /usr/local/src/nginx/start.sh
RUN chmod +x /usr/local/src/nginx/start.sh

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["/usr/local/src/nginx/start.sh"]