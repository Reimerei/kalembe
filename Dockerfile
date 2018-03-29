FROM node:latest

RUN apt-get update
RUN apt-get install -y rsync

EXPOSE 4000
WORKDIR /source