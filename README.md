# ELECTIVE-WEB-COMPOSE

## Description
Le projet ELECTIVE-WEB-COMPOSE vise à déployer une plateforme web complète pour un système de gestion de restauration en ligne. Le système est composé de plusieurs services, dont une interface utilisateur (`elective-web-front`), des services d'authentification (`elective-web-auth`), de gestion de restaurant (`elective-web-restaurant`), de gestion de commandes (`elective-web-order`), ainsi qu'une base de données MongoDB, une base de données MySQL, un serveur Traefik pour le routage des requêtes, Prometheus pour la surveillance, Grafana pour l'analyse des données, et GitLab pour la gestion du code source et de CI/CD.

## Prérequis
- Docker et Docker Compose installés sur votre machine.
- Connaissance de base de Docker et des conteneurs.
- Accès à Docker Hub pour récupérer les images nécessaires.

## Configuration

Avant de lancer le projet, vous devez configurer les variables d'environnement utilisées dans le `docker-compose.yml`. Créez un fichier `.env` à la racine du projet et ajustez les valeurs suivantes selon votre configuration :

```
#NOMS DES SERVICES
BACK_AUTH_NAME=elective-web-auth
BACK_RESTAURATION_NAME=elective-web-restaurant
BACK_ORDER_NAME=elective-web-order
FRONT_MAIN_NAME=elective-web-front

#VERSIONS DES SERVICES
FRONT_MAIN_VERSION=latest
BACK_AUTH_VERSION=latest
BACK_RESTAURATION_VERSION=latest
BACK_ORDER_VERSION=latest
MONGO_VERSION=4.2.0
MYSQL_VERSION=8.0-debian
TRAEFIK_VERSION=v2.11
GITLAB_VERSION=latest

#PREFIXE DES SERVICES
BACK_AUTH_PREFIX=/auth
BACK_RESTAURATION_PREFIX=/restaurant
BACK_ORDER_PREFIX=/order
PROMETHEUS_PREFIX=/prometheus
GRAFANA_PREFIX=/metrics
GITLAB_PREFIX=/gitlab

#PORTS DES SERVICES
FRONT_MAIN_PORT=4000
BACK_AUTH_PORT=3000
BACK_ORDER_PORT=3001
BACK_RESTAURATION_PORT=3002
GRAFANA_PORT=3007
GITLAB_PORT=3008

MONGO_DB_PORT=27017
MY_SQL_PORT=3306

#DOCKER HUB
NOM_REPO_DOCKERHUB=nom

#MYSQL
MYSQL_ROOT_PASSWORD=root

# GRAFANA
GRAFANA_USER=admin
GRAFANA_PASSWORD=admin

# DEFAULT BASE_URL
BASE_URL=app.localhost
```

## Démarrage
Pour démarrer le projet, exécutez la commande suivante à la racine du projet :

```
docker-compose up -d
```

Cela lancera tous les services définis dans votre fichier docker-compose.yml. Vous pouvez vérifier l'état des conteneurs avec :

```
docker-compose ps
```

## Accès aux Services
- Frontend: http://<`BASE_URL`>/
- Grafana (Analyse des données): http://<`BASE_URL`><`GRAFANA_PREFIX`>/
- GitLab (Gestion du code source): http://<`BASE_URL`><`GITLAB_PREFIX`>/

## Surveillance et Logging
- **Prometheus**: Accédez à Prometheus sur le port 9090 pour la surveillance de vos services.
- **Grafana**: Utilisez Grafana sur le port configuré pour visualiser les métriques collectées par Prometheus.

## Arrêt et Nettoyage
Pour arrêter les services et nettoyer les conteneurs, exécutez :

```
docker-compose down
```