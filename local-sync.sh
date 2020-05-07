. ./.auto-sync.config

rsync --filter=':- .gitignore' --exclude '.auto-sync.config' --exclude '.git' -rvza --progress --delete --force $REMOTE_SSH_PATH ./
