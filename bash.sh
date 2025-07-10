#!/bin/bash
source info.env

if grep -q "my-app" "$1" ; then

docker build -t dockerf1:latest .

docker tag dockerf1:latest myusername/dockerf1:latest

docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"

docker push khachatryanhakob/dockerf1:latest

docker run -it -p 8081:8081 --name my-container khachatryanhakob/dockerf1:latest 

else
   echo "there is not my-app"
fi
