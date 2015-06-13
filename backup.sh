#!/usr/local/bin/zsh

# variables
#SOURCE_DIR=~/Dropbox
declare -a SOURCE_DIRS=(~/Dropbox ~/Code)
BACKUP_DIR=/Volumes/archive/backup/weekly
EXCLUDES='.DS_STORE'

# run backup task
read -p "Ready to backup files now? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  if [ -d $BACKUP_DIR ]; then
    echo "$BACKUP_DIR connected."
    echo "Backing up files..."
    for SOURCE_DIR in ${SOURCE_DIRS[@]}
    do
      rsync -av --delete --exclude $EXCLUDES $SOURCE_DIR $BACKUP_DIR
    done
  else
    echo "Can't find $BACKUP_DIR."
  fi
fi