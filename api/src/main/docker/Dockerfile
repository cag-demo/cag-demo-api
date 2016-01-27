FROM java:8-jre
MAINTAINER daniel.marell@cag.se

ENV SE_CAGLABS_CODENIGHT_ENVIRONMENT local
COPY target/codenight.jar /
EXPOSE 8080
CMD java -jar /codenight.jar
