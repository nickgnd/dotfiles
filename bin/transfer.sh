#!/usr/local/bin/zsh

# variables
SOURCE_DIR=~/Code
BACKUP_DIR=max@HerrDirektor.local:'~'
EXCLUDES='.DS_STORE'

# run backup task
read -p "Ready to transfer files now? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  rsync -av --delete --exclude $EXCLUDES $SOURCE_DIR -e ssh $BACKUP_DIR
fi