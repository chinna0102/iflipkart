FROM openjdk:8
EXPOSE 8080
ADD target/mahesh.jar mahesh.jar
ENTRYPOINT [ "java","-jar","/mahesh.jar"]
