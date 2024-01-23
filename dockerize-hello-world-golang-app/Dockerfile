# Using golang apline base image
FROM golang:1.21.6-alpine3.19

# Creating a working directory app
WORKDIR /app/

# Adding all files / directories to docker image's working directory i.e. /app/
ADD . .

# Running command to build executable in the main folder of working directory.
RUN go build -o /app/main 

# Executing the already build executable from the above step.
CMD /app/main