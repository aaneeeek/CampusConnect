# Use Tomcat with JDK
FROM tomcat:10.1-jdk17

# Install bash tools (optional)
RUN apt-get update && apt-get install -y unzip

WORKDIR /

# Copy source code
COPY /src /workspace/src

COPY command.sh /temp/command.sh

COPY /src/main/webapp/WEB-INF/lib/postgresql-42.7.10.jar /usr/local/tomcat/lib

RUN sed -i 's/\r$//' /temp/command.sh

RUN chmod +x temp/command.sh

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["/temp/command.sh"]