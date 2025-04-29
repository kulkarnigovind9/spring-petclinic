FROM openjdk:19
VOLUME /tmp
EXPOSE 8080
ARG JAR_FILE=out/*.jar  # Changed from 'target' to 'out'
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]  # Fixed path
