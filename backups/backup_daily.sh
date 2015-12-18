#!/usr/local/bin/zsh

# wait until network/volume connected
# echo "Wait for some seconds util network is connected"
# sleep 10

# variables
SOURCE_DIRS=(~/Code
            ~/Dropbox
            /Volumes/Media/iTunes\ Media/Music)
BACKUP_DIR=/Volumes/archive/backup/daily
REMOTE_HOST=max@HerrDirektor.local
EXCLUDE_LIST=~/dotfiles/backups/backup-excludes.txt
VOLUME=/Volumes/archive
LOG_FILE=~/dotfiles/backups/log/backup.log
LOG_MAXLINES=7000
LOG_MINLINES=2000

# run backup task
if [ -d $VOLUME ]; then
  echo "\nLocal backup $(date +%Y_%m_%d_%H:%M:%S)" >> $LOG_FILE
  for SOURCE_DIR in ${SOURCE_DIRS[@]}
  do
    rsync -av --delete --exclude-from $EXCLUDE_LIST $SOURCE_DIR $BACKUP_DIR >> $LOG_FILE
  done
else
  echo "\nTry remote backup $(date +%Y_%m_%d_%H:%M:%S)" >> $LOG_FILE
  for SOURCE_DIR in "${SOURCE_DIRS[@]}"
  do
    rsync -av --delete --exclude-from $EXCLUDE_LIST "$SOURCE_DIR" -e ssh "$REMOTE_HOST":"$BACKUP_DIR" >> $LOG_FILE
  done
fi

# calulate size of logfile
LOGSIZE=$( wc $LOG_FILE | awk '{ print $1 }' )

# truncate logfile if needed
if [ $LOGSIZE -ge $LOG_MAXLINES ]
then
  LINECUT=`expr $LOGSIZE - $LOG_MINLINES`
  sed -i "1,$LINECUT d" $LOG_FILE
  sed -i "1i ////////////////  File truncated here on `date`. //////////////// " $LOG_FILE
fi
