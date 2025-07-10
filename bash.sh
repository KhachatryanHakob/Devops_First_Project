#!/bin/bash
set -e

source info.env

if grep -q "my-app" "$1" ; then

  docker build -t dockerf1:latest .

  docker tag dockerf1:latest khachatryanhakob/dockerf1:latest

  echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

  docker push khachatryanhakob/dockerf1:latest

  docker rm -f my-container 2>/dev/null || true

  docker-compose -f "$1" up -d --build

else
  echo "there is not my-app"
fi
