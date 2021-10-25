FROM tomcat:9.0
COPY target/api.war /usr/local/tomcat/webapps/
COPY tomcat.test.jks /usr/local/tomcat/conf
#COPY server.xml /usr/local/tomcat/conf
EXPOSE 8080
EXPOSE 8443
CMD ["catalina.sh","run"]
