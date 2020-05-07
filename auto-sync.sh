# TODO: Remove local sync and make local sync as param of auto sync

. ./.auto-sync.config

rsync --filter=':- .gitignore' --exclude '.auto-sync.config' --exclude '.git' -rvza --progress --delete --force ./ $REMOTE_SSH_PATH
printf '%20s\n' | tr ' ' -

fswatch -o . | while read file;
    do
        rsync --filter=':- .gitignore' --exclude '.auto-sync.config' --exclude '.git' -rvza --progress --delete --force ./ $REMOTE_SSH_PATH
        printf '%20s\n' | tr ' ' -
    done
