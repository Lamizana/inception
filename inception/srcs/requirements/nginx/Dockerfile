###########################################################
# Dockerfile pour construire les conteneurs installés Nginx
# Basé sur Debian
###########################################################

# Définir l'image de base sur l'avant derniere version de Debian:
FROM debian:bullseye

# Mettre a jour le referentiel:
RUN apt update -y 
RUN apt upgrade -y

# Installez les outils necessaires:
RUN apt install vim -y 
RUN apt install curl -y

# Mettre a jour le referentiel:
RUN apt install nginx -y

# Supprimez le fichier de configuration Nginx par défaut 
RUN rm -v /etc/nginx/nginx.conf 
ADD conf/nginx.conf /etc/nginx/

# Permet l'acces au protocole SSL/TLS:
RUN mkdir -p /etc/nginx/ssl 
RUN apt install openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=alamizan.42.fr/UID=login"
 
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Ajouter "daemon off;" au debut de la configuration 
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose les ports 
EXPOSE 443

# Définit la commande par défaut à exécuter: 
# CMD [ "nginx", "-g", "daemon off;" ]
CMD ["service", "nginx", " start"]
