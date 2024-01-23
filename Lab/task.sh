#! /bin/bash

# Stop and remove all containers
sudo docker stop $(docker ps -aq)
sudo docker rm $(docker ps -aq)

# Remove all images
sudo docker rmi $(docker images -aq)

# Build a new Docker image from the Dockerfile
sudo docker build -t app:latest ../flaskApp/

# Run a new container from the built image
docker run -d -p 5000:5000 app:latest