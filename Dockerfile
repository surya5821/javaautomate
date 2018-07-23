FROM suryaindia/maven
MAINTAINER surya "surya.mekala@gmail.com"
RUN mkdir /opt/javaproject/
RUN cd /opt/javaproject/
RUN yum install -y git
RUN git clone https://github.com/surya5821/java-project.git /opt/javaproject/
RUN cd java-project/
RUN mvn package
RUN sleep 10
RUN chmod +x CounterWebApp.war
RUN ssh -p "default123" scp -r CounterWebApp.war root@192.168.11.113:/home/surya
CMD echo "lets see if it is working fine"
