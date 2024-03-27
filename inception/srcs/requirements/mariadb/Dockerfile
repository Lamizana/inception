###########################################################
# Dockerfile pour construire le conteneur Mariadb
###########################################################

# Définir l'image de base sur l'avant derniere version de Debian:
FROM debian:bullseye

# Mettre a jour le referentiel:
RUN apt-get update -y \
&& apt-get upgrade -y

# Installer Mariadb:
RUN apt-get install mariadb-server -y 

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/script.sh /etc/mysql/mariadb.conf.d

# Donne les droits d'acces au script de lancement:
RUN chmod 775 /etc/mysql/mariadb.conf.d/script.sh

# Expose le port:
EXPOSE 3306

# Définit la commande par défaut à exécuter: 
ENTRYPOINT ["/etc/mysql/mariadb.conf.d/script.sh"]