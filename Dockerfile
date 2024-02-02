# Permet de definir l'image source:
FROM debian:9	

# Permet d'executer des commandes dans notre conteneur:
RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

# Permet d'ajouter des fichiers dans notre repertoire:
ADD . /app/

# Permmet de definir le repertoire de travail (equivalent a cd):
WORKDIR /app

# Permet d'installer le packet nodejs:
RUN npm install

# Permet d'indoquer le port d'ecoute:
EXPOSE 2368

# Permet d'indiquer le repertoire a partage:
VOLUME /app/logs

# Permet a notre conteneur de savoir quel commande il doit executer au demarrage:
CMD npm run start
