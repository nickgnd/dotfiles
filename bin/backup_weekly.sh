#!/usr/local/bin/zsh

SOURCE_DIR=/Volumes/archive/backup/daily
BACKUP_DIR=/Volumes/archive/backup/weekly
EXCLUDE_LIST=~/dotfiles/bin/backup-excludes.txt
VOLUME=/Volumes/archive

# run backup task
read -p "Ready to backup files now? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  if [ -d $BACKUP_DIR ]; then
    rsync -a --delete --progress --exclude-from $EXCLUDE_LIST $SOURCE_DIR $BACKUP_DIR
  else
    echo "Can't find $BACKUP_DIR."
  fi
fi
