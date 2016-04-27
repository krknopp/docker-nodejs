# Drupal Dockerfile Config
FROM node:4
MAINTAINER Kerry Knopp <kerry@codekoalas.com>

RUN apt-get update \
 && apt-get install -y git-core cron && rm -rf /var/lib/apt/lists/*

# Predefine ENV
ENV NODE_START="server.js"

# Add files.
ADD node-start /node-start
ADD ssmtp.conf /etc/ssmtp/ssmtp.conf
ADD crons.conf /root/crons.conf
ADD post-merge /post-merge

#Add cron job
RUN crontab /root/crons.conf

# Install pm2
RUN npm install -g pm2

WORKDIR /usr/src/app

#CMD ["node" , "-g" , "server.js"]
CMD ["bash" , "/node-start"]
