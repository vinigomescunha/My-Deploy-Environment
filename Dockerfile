FROM ubuntu:18.04
RUN mkdir -p /items
WORKDIR /items
RUN echo "Initialize..."
RUN apt-get update -qq && apt-get install -y build-essential wget curl git psmisc
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN git clone https://github.com/vinigomescunha/My-Deploy-Environment.git .
EXPOSE 9000
RUN cd /items/my-app && npm install && npm install -g nodemon
CMD [ "nodemon", "index.js" ]
