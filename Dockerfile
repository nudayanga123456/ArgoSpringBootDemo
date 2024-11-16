# Stage :: App build
FROM maven:3.9.6-eclipse-temurin-21-alpine AS MAVEN_BUILD

RUN echo "Building for profile: "${profile}

COPY pom.xml /build/
COPY .git /build/.git/
COPY src /build/src/
WORKDIR /build/

RUN mvn package -DskipTests

# Stage :: Image build
FROM openjdk:21-slim

WORKDIR /build

COPY --from=MAVEN_BUILD /build/target/*.jar /build/app.jar

EXPOSE 8080

CMD ["java","-jar","/build/app.jar"]
