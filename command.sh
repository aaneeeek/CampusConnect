#!/bin/bash


echo "Starting Tomcat..."

mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes
javac -cp "/usr/local/tomcat/lib/*" -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes /workspace/src/main/java/*/*.java


catalina.sh run 