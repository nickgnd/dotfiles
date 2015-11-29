#!/usr/local/bin/zsh

SOURCE_DIRS=(~/Code \
            ~/Dropbox \
            /Volumes/Media)
BACKUP_DIR=/Volumes/archive/backup/daily
EXCLUDE_LIST=~/dotfiles/bin/backup-excludes.txt
VOLUME=/Volumes/archive

# run backup task
read -p "Ready to backup files now? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  if [ -d $BACKUP_DIR ]; then
    for SOURCE_DIR in ${SOURCE_DIRS[@]}
    do
      rsync -a --delete --progress --exclude-from $EXCLUDE_LIST $SOURCE_DIR $BACKUP_DIR
    done
  else
    echo "Can't find $BACKUP_DIR."
  fi
fi
