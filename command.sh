#!/bin/bash



echo "Compiling java classes..."

mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes


javac -cp /usr/local/tomcat/lib/servlet-api.jar:/workspace/src/main/webapp/WEB-INF/lib/postgresql-42.7.10.jar -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes /workspace/src/main/java/*/*.java

echo "Starting Tomcat..."

catalina.sh run

sleep 2

