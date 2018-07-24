FROM suryaindia/maven
MAINTAINER surya "surya.mekala@gmail.com"
ADD .s3cfg /root/.s3cfg
SHELL ["/bin/bash", "-lc"]
RUN mkdir -p /opt/javaproject/
RUN yum install -y git
RUN git clone https://github.com/surya5821/java-project.git /opt/javaproject/
RUN cd /opt/javaproject
WORKDIR /opt/javaproject/
#RUN cd java-project/
RUN mvn package
RUN yum install awscli -y
RUN wget https://sourceforge.net/projects/s3tools/files/s3cmd/2.0.1/s3cmd-2.0.1.tar.gz
RUN tar xzf s3cmd-2.0.1.tar.gz
WORKDIR /opt/javaproject/s3cmd-2.0.1
RUN python setup.py install
RUN s3cmd put -r /opt/javaproject/target/CounterWebApp.war s3://urstrulysurya/
