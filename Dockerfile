FROM tomcat:8.0-alpine
COPY target/api.war /usr/local/tomcat/webapps/
COPY . /usr/local/tomcat/conf/
EXPOSE 8081
CMD ["catalina.sh","run"]
