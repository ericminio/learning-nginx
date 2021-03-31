FROM nginx

# RUN apt-get update && apt-get install -y vim

COPY start.sh /usr/local/src/nginx/start.sh
RUN chmod +x /usr/local/src/nginx/start.sh
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

CMD ["/usr/local/src/nginx/start.sh"]