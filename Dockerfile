# CloudFoundry User Authentication & Authorization service with version 3.2.1
FROM java:openjdk-8u66-jre

MAINTAINER Mate Harsadi aka roothema

ENV UAA_CONFIG_PATH /uaa/uaa.yml
ENV CATALINA_HOME /tomcat

ADD run.sh /tmp/
ADD uaa.yml /uaa/uaa.yml
RUN chmod +x /tmp/run.sh

RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz
RUN wget -qO- https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz.md5 | md5sum -c -

RUN tar zxf apache-tomcat-8.0.28.tar.gz
RUN rm apache-tomcat-8.0.28.tar.gz

RUN mkdir /tomcat
RUN mv apache-tomcat-8.0.28/* /tomcat
RUN rm -rf /tomcat/webapps/*

ADD cloudfoundry-identity-uaa-3.2.1.war /tomcat/webapps/
RUN mv /tomcat/webapps/cloudfoundry-identity-uaa-3.2.1.war /tomcat/webapps/ROOT.war

#VOLUME ["/uaa"]

EXPOSE 8080

CMD ["/tmp/run.sh"]