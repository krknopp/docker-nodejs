# docker-nodejs
Custom Node Container that runs custom cron job.

**Environment Variables**  
GIT_REPO - Git HTTPS URL  
GIT_BRANCH - Git branch
GIT_HOSTS - HOSTS file entry, if needed
SESAuthUser - AWS IAM User with rights to send through SES
SESAuthPass - AWS IAM User with rights to send through SES
SESRegion - Required if other than us-east-1
