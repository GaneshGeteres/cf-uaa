# CloudFoundry User Authentication & Authorization service with version 3.2.1
FROM java:openjdk-8u66-jre

MAINTAINER Mate Harsadi aka roothema

ENV UAA_CONFIG_PATH /uaa/uaa.yml
ENV CATALINA_HOME /tomcat

ADD run.sh /tmp/
ADD uaa.yml /uaa/uaa.yml
RUN chmod +x /tmp/run.sh

ADD apache-tomcat-8.0.28.tar.gz /tmp/
#RUN tar zxf /tmp/apache-tomcat-8.0.28.tar.gz
#RUN rm /tmp/apache-tomcat-8.0.28.tar.gz

RUN mkdir /tomcat
RUN mv /tmp/apache-tomcat-8.0.28/* /tomcat
RUN rm -rf /tomcat/webapps/*

ADD cloudfoundry-identity-uaa-3.2.1.war /tomcat/webapps/
RUN mv /tomcat/webapps/cloudfoundry-identity-uaa-3.2.1.war /tomcat/webapps/uaa.war

#VOLUME ["/uaa"]

EXPOSE 8080

CMD ["/tmp/run.sh"]
