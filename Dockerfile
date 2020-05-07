FROM abhishekacharya/myrepo:ubuntu_ssh

RUN apt-get update
RUN apt-get install openjdk-8-jdk
RUN apt-get install maven
COPY pom.xml /usr/local/Calculator/pom.xml
COPY src /usr/local/Calculator/src
WORKDIR /usr/local/Calculator
RUN ["java","-cp","target/Calculator-1.0-SNAPSHOT.jar","com/calculator/Calculator"]
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
