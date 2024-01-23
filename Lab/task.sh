#! /bin/bash

# Stop and remove all containers
sudo docker ps -a | grep "app:latest" | awk '{print $1}' | xargs -r sudo docker stop
#sudo docker stop $(docker ps -aq)
sudo docker ps -a | grep "app:latest" | awk '{print $1}' | xargs -r sudo docker rm
#sudo docker rm $(docker ps -aq)

# Remove all images
sudo docker rmi app
#sudo docker rmi $(docker images -aq)

# Build a new Docker image from the Dockerfile
sudo docker build -t app:latest .

# Run a new container from the built image
sudo docker run -d -p 5000:5000 app:latest