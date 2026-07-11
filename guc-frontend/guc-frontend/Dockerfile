# Base Image
FROM tomcat:11.0

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file into Tomcat
COPY target/guc-frontend.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat Port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]