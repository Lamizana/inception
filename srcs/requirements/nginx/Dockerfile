FROM debian:bookworm

RUN apt-get update -y \
&& apt-get install nginx -y \
&& apt-get install vim -y \
&& apt-get install curl -y \
&& mkdir -p /etc/nginx/ssl 

RUN apt-get install openssl  \
&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
-keyout /etc/nginx/ssl/inception.key -subj \
"/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=alamizan.42.fr/UID=login"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html
# CMD [ "nginx", "-g", "daemon off;" ]
