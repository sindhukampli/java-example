# Use Maven with JDK 17 to build the app
FROM maven:3.8.4-openjdk-17 as builder

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code to the container
COPY src ./src

# Build the application
RUN mvn clean install

# Use the official Tomcat image to run the app
FROM tomcat:9.0-jdk17-corretto

# Copy the built WAR file from the builder stage to the Tomcat webapps directory
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps

# Run Tomcat
CMD ["catalina.sh", "run"]

