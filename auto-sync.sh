. ./.sync.config
rsync --filter=':- .gitignore' --exclude '.sync.config' -rvza --progress --delete --force ./ $REMOTE_SSH_PATH

fswatch -o . | while read file;
    do
        rsync --filter=':- .gitignore' --exclude '.sync.config' -rvza --progress --delete --force ./ $REMOTE_SSH_PATH
    done
