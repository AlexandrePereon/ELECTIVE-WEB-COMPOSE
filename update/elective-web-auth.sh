#!/bin/bash
# Load environment variables from .env file
set -a
source ../.env
set +a

echo "Start"

echo "Pull the latest version of the elective-web-auth"
docker pull ${NOM_REPO_DOCKERHUB}/${BACK_AUTH_NAME}:${BACK_RESTAURATION_VERSION}

echo "Deploy the latest version of the elective-web-auth"
docker-compose up -d --no-deps --force-recreate elective-web-auth

echo "End"

