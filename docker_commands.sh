#!/bin/sh
# This file contain common useful docker commands which can be use in the linux system
# **********************#

# Command return the installed docker's version of docker engine and cli
docker version

# Info command would gives us more information compare to version
docker info

# Command to list down all the images
docker images

# Docker follows/support old style command and new style commnds
# OLD -- docker <command> [option]
# e.g. docker ps
# New -- docker <managed command> <sub commands> [option]
# e.g. docker container ls


#  To remove docker image from the container
docker images rm <Imabge_Name>
e.g. docker images rm goalng-demo-app


# Command to return all container started/Stopped
docker container ls -a

# Docker to remove container which are not running
docker container rm <containerIds space separate>
#e.g. docker container rm 49a2      #<49a2 is just start of the container Id>
# if in case we want to force terminate, remove running container then
# e.g. docker container rm -f 49a2

#  Checking the top process on a given container
docker top <containerId/Name>

# Getting image from the remote repository

docker pull <Imabge_Name><:[Tag_name]>
# e.g. docker pull nginx:1.25


#Create dockerimage using dockerFile
docker build -t <tag_name> <location-of-docker-file>
docker build -t "goalng-demo-app" .

# To target a particular stage while building a docker image
# docker build --tagerget <stage_name> -t <image_name> .
docker build --target build -t "my-docker-image" .

# Command to run  a image and allowing network routing 
docker container run <image>[:<tag_name>] [detach, publish port]
#e.g. `docker container run --publish 8800:80 --detach nginx`
# OR docker run --name mongo -d mongo , we can give container's name otherwise docker engine will generate a unqique name automatically

# Docker login to authticate for docker image push to docker hub
docker login [OPTIONS] [SERVER]
docker login # if login already then no need to supply any argument
docker login localhost:8080  # for self hosted registry
docker login --username foo --password <value>
cat ~/my_password.txt | docker login --username foo --password-stdin # or take password from standard input file.

# Tag a docker image
# command
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
e.g. docker tag golang-demo-app  myusername/golang-demo-app:v1.0.0 


# Pushing image to Docker hub
# docker push [OPTIONS] NAME[:TAG]
e.g. docker push myusername/golang-demo-app:v1.0.0
