# Use Tomcat with JDK
FROM tomcat:10.1-jdk17

# Install bash tools (optional)
RUN apt-get update && apt-get install -y unzip

# Set workdir
WORKDIR /usr/local/tomcat

# Copy source code
COPY src /tmp/src

# Compile Java classes
RUN mkdir -p /tmp/classes && \
    javac -cp /usr/local/tomcat/lib/servlet-api.jar -d /tmp/classes /tmp/src/main/java/controller/*.java

# Copy compiled classes into Tomcat ROOT
RUN mkdir -p webapps/ROOT/WEB-INF/classes && \
    cp -r /tmp/classes/* webapps/ROOT/WEB-INF/classes/

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]