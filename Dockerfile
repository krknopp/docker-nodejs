# Drupal Dockerfile Config
FROM node:0.12
MAINTAINER Kerry Knopp <kerry@codekoalas.com>

RUN apt-get update \
 && apt-get install -y git-core cron && rm -rf /var/lib/apt/lists/*

# Predefine ENV
ENV NODE_START="node server.js"

# Add files.
ADD node-start /node-start
ADD ssmtp.conf /etc/ssmtp/ssmtp.conf
ADD crons.conf /root/crons.conf
ADD post-merge /post-merge

#Add cron job
RUN crontab /root/crons.conf

# Define mountable directories.
VOLUME ["/var/www/site", “/etc/apache2/sites-enabled”]

EXPOSE 8000

WORKDIR /usr/src/app

#CMD ["node" , "-g" , "server.js"]
CMD ["bash" , "/node-start"]
