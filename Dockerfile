FROM tomcat:8.0-alpine
COPY target/api.war /usr/local/tomcat/webapps/
COPY migrationpoc.cert.pem /usr/local/tomcat/conf/
COPY migrationpoc.key.pem /usr/local/tomcat/conf/
COPY cert-chain.pem /usr/local/tomcat/conf/
COPY server.xml /usr/local/tomcat/
EXPOSE 8081
EXPOSE 8443
CMD ["catalina.sh","run"]
