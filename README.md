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



