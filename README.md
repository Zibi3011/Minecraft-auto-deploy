# Minecraft Auto Deploy

Projet de TP SecOps visant à automatiser le déploiement d’un serveur Minecraft à l’aide de Docker, avec une interface Web simple de supervision permettant de vérifier l’état du serveur et le nombre de joueurs connectés.

---

## Description

Ce projet met en place :
- Un serveur Minecraft containerisé avec Docker
- Une persistance des données du monde
- Une application Web de supervision (Python / Flask)
- Une architecture simple, reproductible et orientée bonnes pratiques DevOps / SecOps

L’objectif est de faciliter le déploiement, la gestion et la supervision d’un serveur Minecraft de manière automatisée.

---

## Fonctionnalités

### Serveur Minecraft
- Déploiement via Docker Compose
- Utilisation de l’image `itzg/minecraft-server`
- Données persistantes via volumes Docker
- Port par défaut exposé : 25565
- Acceptation automatique du EULA via variable d’environnement

### Supervision Web
- Application Web développée en Python avec Flask
- Vérification de l’état du serveur Minecraft
- Affichage du nombre de joueurs connectés
- Interface accessible via navigateur Web

---

## Technologies utilisées

| Composant | Technologie |
|---------|------------|
| Conteneurisation | Docker |
| Orchestration | Docker Compose |
| Serveur de jeu | Minecraft |
| Supervision | Python, Flask |
| Scripts | Shell |
| Infrastructure | HCL |

---

## Prérequis

- Docker
- Docker Compose (v2 recommandé)
- Python 3.x (pour la supervision si lancée hors Docker)

---

## Installation

### Cloner le dépôt

```bash
git clone https://github.com/Zibi3011/Minecraft-auto-deploy.git
cd Minecraft-auto-deploy

```

## Lancer le serveur Minecraft

    docker compose up -d

Le serveur Minecraft sera accessible à l’adresse :

    <IP_DU_SERVEUR>:25565

---

## Lancer la supervision Web


Accès à l’interface Web :

    http://<IP_DU_SERVEUR>:5000

---

## Variables d’environnement

Certaines variables peuvent être définies dans le fichier docker-compose.yml :

| Variable   | Description                                      |
|------------|--------------------------------------------------|
| EULA=TRUE  | Acceptation du contrat de licence Minecraft      |
| VERSION    | Version du serveur Minecraft                     |
| MEMORY     | Mémoire allouée au serveur                       |

---

## Contribution

Les contributions sont acceptées :

- Fork du projet
- Création d’une branche dédiée
- Pull request claire et documentée

---

## Licence

Ce projet est fourni à des fins pédagogiques dans le cadre d’un TP SecOps.  
La licence peut être ajoutée ou modifiée selon les besoins.

---

## Auteurs

Projet réalisé par :

- Enguéran LECOQ  
- Théo BOULAND  
- Mickaël CHARTIER  
- Arnaud MARÉCHAL
