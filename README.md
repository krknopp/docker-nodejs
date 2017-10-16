# docker-nodejs
Custom Node Container

# npm scripts
`npm run setup` gets run on container startup

**Environment Variables**  
NODE_START - Full startup command (i.e. `pm2 start --no-daemon index.js --watch` or `yarn start`)
GIT_REPO - Git HTTPS URL  
GIT_BRANCH - Git branch
