# Base Image
FROM eclipse-temurin:17-jre

# Working Directory
WORKDIR /app

# Copy JAR
COPY target/*.jar app.jar

# Expose Spring Boot Port
EXPOSE 9090

# Run Application
ENTRYPOINT ["java","-jar","app.jar"]