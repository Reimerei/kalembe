FROM node:latest

RUN apt-get update
RUN apt-get install -y rsync
RUN mkdir ~/.ssh/ && ssh-keyscan -H acorn.x-hain.de >> ~/.ssh/known_hosts

EXPOSE 4000
WORKDIR /source