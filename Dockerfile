FROM ubuntu:16.04
MAINTAINER Petr Besir Horacek <petr.horacek@legerete.cz>

RUN apt-get update && \
	apt-get install -y \
	git \
	make \
	software-properties-common

RUN add-apt-repository ppa:olipo186/git-auto-deploy

RUN apt-get update

RUN apt-get install  -y git-auto-deploy

#Start
ADD start.sh ./start.sh
RUN chmod +x ./start.sh

#Set port
EXPOSE 8080

#Start it
ENTRYPOINT ["/start.sh"]