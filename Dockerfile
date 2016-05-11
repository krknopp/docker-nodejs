# Drupal Dockerfile Config
FROM node:4
MAINTAINER Kerry Knopp <kerry@codekoalas.com>

RUN apt-get update \
 && apt-get install -y git-core cron && rm -rf /var/lib/apt/lists/*

# Predefine ENV
ENV NODE_START="server.js"

# Add files.
ADD node-start /node-start
ADD crons.conf /root/crons.conf

#Add cron job
RUN crontab /root/crons.conf

WORKDIR /usr/src/app

CMD ["bash" , "/node-start"]
