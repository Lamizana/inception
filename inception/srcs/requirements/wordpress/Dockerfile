###########################################################
# Dockerfile pour construire le conteneur Wordpress
# Basé sur Debian
###########################################################

# Définir l'image de base sur l'avant derniere version de Debian:
FROM debian:bullseye

# Mettre a jour le referentiel:
RUN apt-get update -y \
&& apt-get upgrade -y 

# Installez les outils necessaires:
RUN apt-get install wget -y 

# Installation de php:
RUN apt-get install -y php7.3 \
&& apt-get install php-fpm -y \ 
&& apt-get install php-mysql -y \
&& apt-get install mariadb-client -y


RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz \
&& rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY conf/php.ini /var/www/wordpress
COPY conf/wp-config.php /var/www/wordpress
