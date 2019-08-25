# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine
# Add Maintainer Info
LABEL maintainer="kulkarnigovind9@gmail.com"
# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} spring-petclinic.jar

# Run the jar file 
ENTRYPOINT ["java","-Dspring.profiles.active=mysql","-jar","/spring-petclinic.jar"]