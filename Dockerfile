# Drupal Dockerfile Config
FROM node:4
MAINTAINER Kerry Knopp <kerry@codekoalas.com>

RUN apt-get update \
 && apt-get install -y git-core cron && rm -rf /var/lib/apt/lists/*

# Override Environment Variables
ENV NPM_CONFIG_LOGLEVEL=warn

# Add files.
ADD node-start /node-start
ADD ssmtp.conf /etc/ssmtp/ssmtp.conf
ADD crons.conf /root/crons.conf
ADD post-merge /post-merge

#Add cron job
RUN crontab /root/crons.conf

# Install pm2
RUN npm install -g pm2

#EXPOSE 8000

WORKDIR /usr/src/app

#CMD ["node" , "-g" , "server.js"]
CMD ["bash" , "/node-start"]
