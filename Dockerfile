FROM tomcat:9.0.80-jdk21-openjdk-slim-bullseye

COPY ./target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
