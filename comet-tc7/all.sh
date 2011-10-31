#!/bin/sh





rm -rf /Applications/eclipse/apache-tomcat-7.0.22/webapps/comet*
mvn clean install
cp target/comet.war /Applications/eclipse/apache-tomcat-7.0.22/webapps/

