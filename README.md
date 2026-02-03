# Minecraft-auto-deploy
TP SecOps 

Contributeurs 
Engueran LECOQ (Partie 1), 
Théo BOULAND  (Partie 2),
Mickaël CHARTIER (Partie 3),
Arnaud MARÉCHAL (Partie 4).

<br/>

########## Docker – Serveur Minecraft ##########

Cette partie du projet concerne la conteneurisation du serveur Minecraft à l’aide de Docker Compose.

**Technologies**

- Docker
  
- Docker Compose v2
  
- Image Docker : itzg/minecraft-server

<br/>

**Fonctionnement**

Le serveur Minecraft est déployé dans un conteneur Docker avec les caractéristiques suivantes :

- Acceptation de l’EULA via variable d’environnement
  
- Persistance des données (monde Minecraft) via un volume Docker
  
- Exposition du port 25565 pour permettre la connexion des joueurs

La persistance permet de conserver le monde même après un redémarrage du conteneur ou de la machine.

<br/>

**Connexion au serveur**

```<IP_DU_SERVEUR>:25565```

<br/>

########## Web Status – Supervision du serveur ##########

Cette partie du projet concerne le développement et le déploiement d’une application Web de supervision du serveur Minecraft.

<br/>

**Technologies**

- Python
  
- Flask
  
- Librairie mcstatus
  
- Docker

  <br/>

**Fonctionnalités**

La Web Status Page permet de :

- Vérifier si le serveur Minecraft est en ligne

- Afficher le nombre de joueurs connectés

- Fournir une interface Web très simple et accessible

  <br/>

**Accès à la Web Status**
<br/>

L’application est exposée sur le port 5000 :

```http://<IP_DU_SERVEUR>:5000```

<br/>

Démarrage des services manuellement

<br/>

dossier /app → ```docker compose up -d ```
