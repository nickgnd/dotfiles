#!/usr/local/bin/zsh

# variables
SOURCE_DIR=~/Code
REMOTE_HOST=max@HerrDirektor.local
EXCLUDE_LIST=~/dotfiles/backups/backup-excludes.txt
LOG_FILE=~/dotfiles/backups/log/transfer.log
LOG_MAXLINES=7000
LOG_MINLINES=2000


# run backup task
echo "\nTransfer files to HerrDirektor: $(date +%Y_%m_%d_%H:%M:%S)" >> $LOG_FILE

echo "Transfer Code directory..." >> $LOG_FILE
rsync -av --delete --exclude-from $EXCLUDE_LIST "$SOURCE_DIR" -e ssh "$REMOTE_HOST":"~" >> $LOG_FILE

echo "Transfer Music..." >> $LOG_FILE
rsync -av --delete --exclude-from $EXCLUDE_LIST \
"/Volumes/Media/iTunes Media/Music" \
-e ssh "$REMOTE_HOST":"~/Music/iTunes/iTunes\ Media/" >> $LOG_FILE

echo "Transfer iTunes Library..." >> $LOG_FILE
rsync -av --delete --exclude-from $EXCLUDE_LIST \
"/Volumes/Media/iTunes Library.itl" \
"$REMOTE_HOST":"~/Music/iTunes/" >> $LOG_FILE

# calulate size of logfile
LOGSIZE=$( wc $LOG_FILE | awk '{ print $1 }' )

# truncate logfile if needed
if [ $LOGSIZE -ge $LOG_MAXLINES ]
then
  LINECUT=`expr $LOGSIZE - $LOG_MINLINES`
  sed -i "1,$LINECUT d" $LOG_FILE
  sed -i "1i ////////////////  File truncated here on `date`. //////////////// " $LOG_FILE
fi
