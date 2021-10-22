FROM tomcat:8.0-alpine
COPY target/api.war /usr/local/tomcat/webapps/
COPY tomcat.test.jks /usr/local/tomcat/conf
COPY server.xml /usr/local/tomcat/conf
EXPOSE 8081
EXPOSE 8443
CMD ["catalina.sh","run"]
