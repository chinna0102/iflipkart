FROM openjdk:8
EXPOSE 8080
ADD target/mahesh.war mahesh.war
ENTRYPOINT [ "java","-war","/mahesh.war"]
