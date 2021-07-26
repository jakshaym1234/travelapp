#!/bin/bash
export VERSION="latest"

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker build . --file ./java-app/Dockerfile --tag $DOCKER_USERNAME/java-travel-app:$VERSION
docker push $DOCKER_USERNAME/java-travel-app:$VERSION
docker rmi $DOCKER_USERNAME/java-travel-app:$VERSION
docker build . --file ./golang-app/Dockerfile --tag $DOCKER_USERNAME/golang-travel-app:$VERSION
docker push $DOCKER_USERNAME/golang-travel-app:$VERSION
docker rmi $DOCKER_USERNAME/golang-travel-app:$VERSION

kubectl apply -f ./kubernetes-manifests/java-app-deployment.yml 
kubectl apply -f ./kubernetes-manifests/golang-app-deployment.yml 
kubectl apply -f ./kubernetes-manifests/travelapp-deployment.yml