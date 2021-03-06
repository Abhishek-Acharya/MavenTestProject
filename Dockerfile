FROM openjdk:8-alpine

# RUN apt-get update
# RUN apt-get install openjdk-8-jre-headless
# RUN apt-get install maven
# COPY pom.xml /usr/local/Calculator/pom.xml
# COPY src /usr/local/Calculator/src
# WORKDIR /usr/local/Calculator
# RUN mvn package
RUN apk update
RUN apk add maven
COPY pom.xml /usr/local/Calculator/pom.xml
COPY src /usr/local/Calculator/src
WORKDIR /usr/local/Calculator
RUN mvn package
CMD ["java","-cp","target/Calculator-1.0-SNAPSHOT.jar","com/calculator/Calculator"]
