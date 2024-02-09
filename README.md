# **INCEPTION**
- *Created by Lamizana in 01/02/20224*
> [!NOTE]
> Virtualiser plusieurs images Docker en les créant dans une machine virtuelle personnelle.
<details>
<summary>Notions:</summary>
    
    - Administration system.
    - Docker.
</details>

# Introduction

• Ce projet a pour but d'élargir les connaissances en matière d'administration système en utilisant Docker.

<details>
<summary>régles générales:</summary>

• Ce projet doit être réalisé sur une machine virtuelle.

• Tous les fichiers nécessaires à la configuration du projet doivent être placés
dans un dossier srcs.

• Un Makefile est également nécessaire et doit être placé à la racine du répertoire,
IL doit configurer l'ensemble de l'application, uiliser:

        - docker-compose.yml
> Permet de construire les images Docker.

• Ce sujet nécessite de mettre en pratique de nouveaux concepts de base.

• Ne pas hésiter à lire beaucoup de documentation relative à l'utilisation 
de Docker, ainsi que toute autre doc utile pour mener à bien ce travail.
</details>

# Partie obligatoire

- Ce projet consiste à mettre en place une petite infrastructure composée de différents services
selon des règles spécifiques.

- L'ensemble du projet doit être réalisé dans une machine virtuelle. Utiliser:

      - docker compose.

- Chaque image Docker doit porter le même nom que le service correspondant.

- Chaque service doit être exécuté dans un conteneur dédié.

> [!IMPORTANT]
> Pour des raisons de performance, les conteneurs doivent être construits à partir de
> l'avant-dernière version stable d'Alpine ou de Debian.

- Ecrire egalement les Dockerfiles, un par service. Les Dockerfiles doivent
être appelés dans votre docker-compose.yml par votre Makefile.

- Construire  les images Docker de votre projet. Il est alors interdit de tirer des images Docker
prêtes à l'emploi, ainsi que d'utiliser des services tels que DockerHub.

- Installer ensuite:

      - Un conteneur Docker qui contient NGINX avec TLSv1.2 ou TLSv1.3 uniquement.
  
      - Un conteneur Docker qui contient WordPress + php-fpm (il doit être installé et configuré)
      mais sans nginx.
  
      - Un conteneur Docker qui contient uniquement MariaDB sans nginx.
  
      - Un volume qui contient la base de données WordPress.
  
      - Un deuxième volume qui contient les fichiers du site web WordPress.
  
      - Un réseau docker qui établit la connexion entre vos conteneurs.
  
> Vos conteneurs doivent redémarrer en cas de panne.

> [!IMPORTANT]
> Un conteneur Docker n'est pas une machine virtuelle!
>
> Il n'est donc pas recommandé d'utiliser un patch hacky basé sur 'tail -f' 
> et ainsi de suite lorsqu'on essaie de l'exécuter.
> 
> Lire comment fonctionnent les démons et si c'est une bonne idée de les utiliser ou non.

> [!CAUTION]
> Bien entendu, l'utilisation de network : host ou --link ou links : est interdite.
> 
> La ligne network doit être présente dans votre fichier docker-compose.yml.
> 
> Vos conteneurs ne doivent pas être démarrés avec une commande exécutant une boucle infinie.
> 
>Ceci s'applique donc également à toute commande utilisée comme point d'entrée, ou
utilisée dans les scripts d'entrée.
> 
> Voici quelques correctifs interdits: tail -f, bash, sleep infinity, while true.

> En savoir plus sur le PID 1 et les meilleures pratiques pour écrire des Dockerfiles.


- Dans la base de données WordPress, il doit y avoir deux utilisateurs: l'un d'eux étant l'administrateur. Le nom d'utilisateur de l'administrateur ne peut pas contenir admin/Admin ou admin-
istrateur/Administrateur (par exemple, admin, administrateur, Administrator, admin-123, etc...)

> [!IMPORTANT]
> Vos volumes seront disponibles dans le dossier /home/login/data de la machine hôte utilisant Docker.
> Remplacer le login par le vôtre.

- Configurer votre nom de domaine de manière à ce qu'il pointe vers votre adresse IP locale.
- Ce nom de domaine doit être login.42.fr.
- Là encore, utiliser son propre login.
- Par exemple, si votre login est wil: wil.42.fr redirigera vers l'adresse IP pointant vers le site
web de wil.

> [!IMPORTANT]
> La dernière balise est interdite.
> 
> Aucun mot de passe ne doit être présent dans vos Dockerfiles.
> 
> Il est obligatoire d'utiliser des variables d'environnement.
> 
> Il est également fortement recommandé d'utiliser un fichier .env pour stocker les variables d'environnement.
> 
> Le fichier .env doit être situé à la racine du répertoire srcs.
> 
> Votre conteneur NGINX doit être le seul point d'entrée dans votre infrastructure via le port 443
> uniquement, en utilisant le protocole TLSv1.2 ou TLSv1.3.

### Exemple de la structure de répertoire attendue :
<details>
    
```bash
$> ls -alR
total XX
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 .
drwxrwxrwt 17 wil wil 4096 avril 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Makefile
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 srcs
./srcs:
total XX
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 docker-compose.yml
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .env
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 requirements
./srcs/requirements:
total XX
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 bonus
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 mariadb
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 nginx
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 tools
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 wordpress
./srcs/requirements/mariadb:
total XX
drwxrwxr-x 4 wil wil 4096 avril 42 20:45 .
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 conf
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Dockerfile
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .dockerignore
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 tools
[...]
./srcs/requirements/nginx:
total XX
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 conf
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Dockerfile
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .dockerignore
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 tools
[...]

$> cat srcs/.env
DOMAIN_NAME=wil.42.fr
# certificates
CERTS_=./XXXXXXXXXXXX
# MYSQL SETUP
MYSQL_ROOT_PASSWORD=XXXXXXXXXXXX
MYSQL_USER=XXXXXXXXXXXX
MYSQL_PASSWORD=XXXXXXXXXXXX
[...]
$>
```
</details>

> [!CAUTION]
>Pour des raisons de sécurité évidentes, toutes les informations d'identification, clés API, variables env
etc... doivent être sauvegardées localement dans un fichier .env et ignorées par git.
>
> Les informations d'identification stockées publiquement vous conduiront directement à un échec du projet.

# Notion et commandes:

### Commandes Docker:
<details>

```bash
$> docker run XXX
```
> Télécharge l'image si elle n`est pas présente et démarre le conteneur.
```bash
$> docker run hello-world
```
> Lance le conteneur hello-world.
```bash
$> docker run -d -p 8080:80 nginx 
```
> Lance un serveur Nginx.
```bash
$> docker ps
```
> liste les conteneurs demarrées.
```bash
$> docker ps -a
```
> Liste tout les conteneurs.
```bash
$> docker exec -ti ID_RETOURNÉ_LORS_DU_DOCKER_RUN
```
> Affiche des informations sur les objets Docker tels que les images, les conteneurs, les volumes..
```bash
$> docker inspect <name>
```
> Ouvre un shell pour acceder dans le conteneur.
```bash
$> docker stop ID_RETOURNÉ_LORS_DU_DOCKER_RUN
```
> Stoppe le conteneur mais reste sur le disque.
```bash
$> docker rm ID_RETOURNÉ_LORS_DU_DOCKER_RUN
```
> supprime le conteneur.
```bash
$> docker pull hello-world
```
> recupere l'image, la met sur le disque mais ne la lance pas.
```bash
$> docker system prune
```
> Supprime l'ensemble des ressources.
> ```bash
$> docker container prune
```
> Supprime l'ensemble des conteneur
```bash
$> docker images -a
```
> Voir l'ensemble des images présentes sur le disque.
```bash
$> docker rmi ID_RETOURNÉ_LORS_DU_DOCKER_RUN
```
> Supprime l'image du disque.
    
</details>

### Commandes Docker-compose:
<details>

- Une stack est un ensemble de conteneurs Docker lancés via un seul et unique fichier
Docker Compose.

```bash
$> docker-compose up -d
```
> Démarre l'ensemble des contenaurs en arriere-plan.
```bash
$> docker-compose ps
```
> Permet d'afficher le status de l'ensemble de notre stack.
```bash
$> docker-compose logs -f --tail 5
```
> Permet d'afficher les logs de notre stack.
```bash
$> docker-compose images
```
> Permet d'afficher toutes les images ainsi que leur ID.
```bash
$> docker-compose stop
```
> Permet d'arreter l'ensemble des service de notre stack.
```bash
$> docker-compose down
```
> Permet de détruire l'ensemble des ressources d'une stack.
```bash
$> docker-compose config
```
> Permet de valider la syntaxe de notre fichier docker-compose.yml
 
</details>

### Fichier Docker-compose.yml:
<details>

```docker-compose.yml
image: 
```
> Permet de spécifier l'***image source*** pour le conteneur.
```docker-compose.yml
build: 
```
> Permet de spécifier le ***Dockerfile source*** pour le conteneur.
```docker-compose.yml
volume:
```
> Permet de spécifier les ***points de montages*** entre le systéme hote et les conteneurs. 
```docker-compose.yml
restart:
```
> Permet de définir le comportement du conteneur ***en cas d'arret*** du processus.
```docker-compose.yml
environment:
```
> Permet de définir les ***variables d'environnement***.
```docker-compose.yml
depends_on:
```
> Permet de dire que le conteneur ***dépend*** d'un autre conteneur.
```docker-compose.yml
ports:
```
> Permet de définir Les ***ports disponibles*** entre la machine hote et le conteneur.
</details>

# Partie Bonus

- Un fichier Dockerfile doit être écrit pour chaque service supplémentaire.
- Ainsi, chacun d'entre eux s'exécutera dans son propre conteneur et aura, si nécessaire, son volume dédié.
- Liste de bonus :
      
      - Mettre en place un cache redis pour votre site WordPress afin de gérer correctement le cache.
      - Mettre en place un serveur FTP pointant vers le volume de votre site WordPress.
      - Créer un site web statique simple dans le langage de votre choix sauf PHP !.
              - Par exemple, un site vitrine ou un site de présentation de votre CV.
      -  Mettre en place Adminer.
      - Mettre en place un service de votre choix que vous jugez utile. Lors de la soutenance, vous
      devrez justifier votre choix.
> [!NOTE]
> Pour compléter la partie bonus,possibilité de mettre en place des services supplémentaires.
> 
> Dans ce cas, vous pouvez ouvrir plus de ports en fonction de vos besoins.

> [!WARNING]
> La partie bonus ne sera évaluée que si la partie obligatoire est PARFAITE. Parfait signifie que la partie obligatoire a été intégralement réalisée et qu'elle fonctionne sans dysfonctionnement.
> 
> Si vous n'avez pas satisfait à TOUTES les exigences obligatoires, votre partie bonus ne sera pas évaluée du tout.
