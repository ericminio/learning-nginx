FROM nginx:1.23.4-alpine

# RUN apt-get update && apt-get install -y vim

COPY start-nginx.sh /usr/local/start-nginx.sh
RUN chmod +x /usr/local/start-nginx.sh

COPY nginx.conf /etc/nginx/nginx.conf

