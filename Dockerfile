FROM ubuntu:18.04
COPY /my-app /my-app
WORKDIR /my-app
RUN echo "Initialize..."
RUN apt-get update -qq && apt-get install -y build-essential wget curl git psmisc
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs
EXPOSE 9000
RUN npm install
CMD [ "npm", "start" ]
