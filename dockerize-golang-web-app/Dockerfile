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
EXPOSE 8080

#  Executing the application
CMD /app/main