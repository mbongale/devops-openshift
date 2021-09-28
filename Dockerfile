FROM tomcat
COPY target/api.war /usr/local/tomcat/webapps/
EXPOSE 8081
