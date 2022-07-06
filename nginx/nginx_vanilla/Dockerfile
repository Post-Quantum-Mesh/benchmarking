FROM nginx:1.20


RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY nginx-conf/nginx.conf /etc/nginx/nginx-conf/nginx.conf
COPY nginx-conf/servercert.pem /usr/local/nginx/pki/servercert.pem
COPY nginx-conf/serverkey.pem /usr/local/nginx/pki/serverkey.pem
COPY nginx-conf/mime.types /etc/nginx/nginx-conf/mime.types

EXPOSE 4433

CMD ["nginx", "-c", "nginx-conf/nginx.conf", "-g", "daemon off;"]