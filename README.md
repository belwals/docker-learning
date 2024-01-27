# Docker Learning Repository

Welcome to the Docker Learning Repository! This space is dedicated to the exploration and documentation of Docker concepts for educational purposes, providing valuable insights for future reference.

## Theoretical Information about Docker

In this section, you will find comprehensive theoretical information about Docker, covering fundamental concepts and principles related to containerization.[Docker learning](./docker_readme.md)

## Docker Commands

Discover a set of essential Docker commands designed to assist you in building Docker images and effectively managing containers. [Docker commands](./docker_commands.sh)

## Learning Repository Content

Explore various Docker image examples within the learning repository, each illustrating different use cases and scenarios.

* dockerize-hello-world-golang-app
    *  A straightforward "Hello World" Go application.
    *  Walks through the process of building a Docker image for a basic Go application.
* dockerize-golang-app
    * Features a Go-based RESTful application.
    * Showcases a REST application with exposed endpoints.
* multi-stage-build
  * Demonstrates a multi-stage build with two distinct stages of image creation:
      * build stage: Responsible for generating the application's executable.
      * runner stage: Reuses the pre-built stage and runs on the base image.
    The Docker image encompasses both the image building process and the creation of an application user.

## Sample go docker image
```
# Setting base image for the application
FROM golang:1.21.6-alpine3.19

# Creating a app group and adding a application user app
# to avoid running tha applicationa as a root user 
RUN addgroup -S app && adduser -S appUser -G app

# Setting user to run the app
USER appUser

# Setting working directory for the application
WORKDIR /app

# before copying the application we are keeping go mod in the app directory just to allow build of go executable
COPY ../go.mod /app/

# Copying all files to remote destination
COPY . .

#  Running go build command to create the executable
RUN go build -o /app/main router/main.go

# Switching user to root so that app user can have grant only on the application's executable
USER root

# Providing ownership to appUser from the app group
RUN chown -R appUser:app /app/main

# Setting back the user to appUser
USER appUser

# Exposing application port to 4000
EXPOSE 4000

#  Executing the application
CMD /app/main

```

Feel free to delve into the contents of this Docker learning repository. The provided examples serve as practical demonstrations, enhancing your understanding of Docker concepts. Contributions are welcome as we collectively expand our knowledge of Docker!
