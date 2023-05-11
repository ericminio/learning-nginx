#!/bin/sh

cat /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'