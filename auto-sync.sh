. ./.auto-sync.config
rsync --filter=':- .gitignore' --exclude '.auto-sync.config' -rvza --progress --delete --force ./ $REMOTE_SSH_PATH
echo

fswatch -o . | while read file;
    do
        rsync --filter=':- .gitignore' --exclude '.auto-sync.config' -rvza --progress --delete --force ./ $REMOTE_SSH_PATH
        echo
    done
