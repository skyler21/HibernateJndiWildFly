# Alpine Linux with OpenJDK JRE
FROM jboss/wildfly:18.0.0.Final
# copy WAR into image
ADD mysql-connector-java-8.0.19.jar /
ADD commands.cli /opt/jboss/wildfly/standalone/configuration/
ADD executeCli.sh /
###RUN mkdir -p /dev/null
RUN bash -c "/executeCli.sh"
ADD HibernateJndi.war /opt/jboss/wildfly/standalone/deployments/

## add Amin user admin/Admin#001 
RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin#001 --silent

# run application with this command line 
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
##CMD ["/opt/jboss/wildfly/bin/standalone.sh"]
# http://localhost:8080/HibernateJndi/GetEmployeeById?empId=1
# http://localhost:8080/HibernateJndi/