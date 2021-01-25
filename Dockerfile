FROM maven:3.6.3-openjdk-11-slim as build

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN mvn clean package

FROM openjdk:11-jre-slim
WORKDIR /usr/app
COPY --from=build /usr/src/app/target/agenda*.jar /usr/app/agenda.jar
EXPOSE 8080
CMD ["java", "-jar", "agenda.jar"]