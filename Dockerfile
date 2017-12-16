# use the ubuntu base image
FROM phusion/baseimage:0.9.9
MAINTAINER ryanstockdale

# setup ports and volumes to expose for dev
VOLUME ["/home/working"]

# basic env
ENV DEBIAN_FRONTEND noninteractive
ENV REFRESHED_AT 2017_10_04_1

# install node
WORKDIR /home

RUN mkdir -p working

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update && apt-get -y install python-software-properties \
	&& add-apt-repository -y ppa:chris-lea/node.js
	
RUN apt-get update && apt-get -y install nodejs \
	&& npm cache clean -f \
	&& npm install -g n \
	&& n stable \
	&& npm -g install grunt 
    
RUN apt-get install make
    
# change working directory 
WORKDIR /home/working