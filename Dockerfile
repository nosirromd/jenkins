FROM jenkins/jenkins:lts
LABEL maintainer="nosirromd@gmail.com"
ENV REFRESHED_AT 2022-06-15

USER root
RUN apt-get update; apt-get install -qqy sudo wget
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN wget http://get.docker.com/builds/Linux/x86_64/docker-latest.tgz
RUN tar -xvzf docker-latest.tgz
RUN mv docker/* /usr/bin/

USER jenkins
RUN /usr/local/bin/install-plugins.sh jaxb junit git git-client ssh-slaves greenballs chucknorris ws-cleanup


