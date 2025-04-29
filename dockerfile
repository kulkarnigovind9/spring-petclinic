FROM maven:3.8-openjdk-19 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests -DbuildDirectory=out

FROM openjdk:19
COPY --from=build /app/out/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
