FROM debian:bookworm

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install wget -y \
&& apt-get install vim -y 

RUN apt-get install -y php7.3 \
&& apt-get install php-fpm -y\ 
&& apt-get install php-mysql -y

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

