# Setting base image for the application
FROM golang:1.21 as build

# Setting working directory for the application
WORKDIR /app

# before copying the application we are keeping go mod in the app directory just to allow build of go executable
COPY ../go.mod /app/

# Copying all files to remote destination
COPY . .

#  Running go build command to create the executable
RUN go build -o /app/main main.go

# Using base image scratch to run the application, using scratch here as it doesn't contain folder structure with additonal capabilities
FROM scratch as runner

# Already build executable is getting used
COPY --from=build /app/main /app/main

# Exposing application port to 4000
EXPOSE 8080

#  Executing the application
CMD ["/app/main"]