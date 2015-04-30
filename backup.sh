#!/usr/local/bin/zsh

# variables
SOURCE_DIR=~/Dropbox
BACKUP_DIR=/Volumes/archive/backup
EXCLUDES='.dropbox*'

# run backup task
#echo "Weekly backup, please connect $BACKUP_DIR"
read -p "Ready to backup files now? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  if [ -d $BACKUP_DIR ]; then
    echo "$BACKUP_DIR connected."
    echo "Backing up files..."
    rsync -aEv --delete --exclude $EXCLUDES $SOURCE_DIR $BACKUP_DIR
  else
    echo "Can't find $BACKUP_DIR."
  fi
fi