# Use the official Maven image with Amazon Corretto 17
FROM maven:3.8.6-amazoncorretto-17 as builder

WORKDIR /app

# Copy the project files into the Docker image
COPY . .

# Build the project using Maven
RUN mvn clean install

# Use an appropriate Tomcat base image
FROM tomcat:9.0

# Copy the built WAR file from the builder stage to the Tomcat webapps directory
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/

# Run Tomcat
CMD ["catalina.sh", "run"]
