#!/usr/local/bin/zsh

SOURCE_DIRS=(~/Code \
            ~/Dropbox \
            /Volumes/Media)
BACKUP_DIR=/Volumes/archive/backup/daily
EXCLUDE_LIST=~/dotfiles/bin/backup-excludes.txt
VOLUME=/Volumes/archive

# run backup task
if [ -d $VOLUME ]; then
  echo "Local backup $(date +%Y_%m_%d_%H:%M:%S)"
  for SOURCE_DIR in ${SOURCE_DIRS[@]}
  do
    rsync -a --delete --progress --exclude-from $EXCLUDE_LIST $SOURCE_DIR $BACKUP_DIR
  done
else
  echo "Try remote backup $(date +%Y_%m_%d_%H:%M:%S)"
  for SOURCE_DIR in ${SOURCE_DIRS[@]}
  do
    rsync -a --delete --progress --exclude-from $EXCLUDE_LIST $SOURCE_DIR -e ssh Max@192.168.0.18:"$BACKUP_DIR"
  done
fi
