FROM ubuntu:bionic as builder
WORKDIR "/app"
RUN apt-get update && \
      apt-get -y install sudo 
RUN sudo apt-get install -y npm
RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y graphicsmagick
RUN sudo apt install -y imagemagick

RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository ppa:fnu/main-fnu
RUN sudo apt-get update
RUN sudo apt-get -y dist-upgrade
RUN sudo apt-get install -y ffmpeg

COPY package*.json ./
RUN npm install
COPY . . 
CMD ["node", "index.js"]

