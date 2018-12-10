FROM node:alpine 

RUN mkdir -p /plugin/src
WORKDIR /plugin
COPY ./src/package.json /plugin/src
RUN  cd /plugin/src && npm install 
COPY . /plugin
RUN apk --update add git openssh 

CMD  ["sh", "start.sh"]