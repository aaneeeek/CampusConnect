#!/bin/bash


echo "Starting Tomcat..."

mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes
javac -cp /usr/local/tomcat/lib/servlet-api.jar:/workspace/src/main/webapp/WEB-INF/lib/postgresql-42.7.10.jar -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes /workspace/src/main/java/*/*.java


catalina.sh run & 
while true; do
	
	sleep 3
	
	javac -cp /usr/local/tomcat/lib/servlet-api.jar:/workspace/src/main/webapp/WEB-INF/lib/postgresql-42.7.10.jar -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes /workspace/src/main/java/*/*.java

	echo "Compiling java classes..."

done