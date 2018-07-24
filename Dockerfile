FROM suryaindia/maven
MAINTAINER surya "surya.mekala@gmail.com"
SHELL ["/bin/bash", "-lc"]
RUN mkdir -p /opt/javaproject/
RUN yum install -y git
RUN git clone https://github.com/surya5821/java-project.git /opt/javaproject/
RUN cd /opt/javaproject
WORKDIR /opt/javaproject/
#RUN cd java-project/
RUN mvn package
