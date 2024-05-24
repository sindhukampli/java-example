# Use an official Maven image with JDK 17
FROM maven:3.8.5-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code into the image
COPY pom.xml .
COPY src ./src

# Run Maven clean install
RUN mvn clean package

# Use an official JDK 17 runtime image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built artifacts from the build stage
COPY --from=build /app/target/*.jar ./app.jar

# Expose the port the application runs on
EXPOSE 8080

# Define the entry point for the container
ENTRYPOINT ["java", "-jar", "app.jar"]
