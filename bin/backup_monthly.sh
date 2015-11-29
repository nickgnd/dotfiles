#!/usr/local/bin/zsh

SOURCE_DIR=/Volumes/archive/backup/
BACKUP_DIR=/Volumes/archive/backup/monthly/"$(date +%Y_%m_%d)".tar.bz2
VOLUME=/Volumes/archive

# run backup task
read -p "Ready to backup files now? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  if [ -d $VOLUME ]; then
    cd $SOURCE_DIR
    tar -jcvf $BACKUP_DIR daily/
  else
    echo "Can't find $VOLUME."
  fi
fi
