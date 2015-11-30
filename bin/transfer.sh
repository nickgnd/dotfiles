#!/usr/local/bin/zsh

# variables
SOURCE_DIR=~/Code
REMOTE_DIR=max@HerrDirektor.local
EXCLUDE_LIST=~/dotfiles/bin/backup-excludes.txt

# run backup task
read -p "Ready to transfer files now? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  rsync -av --delete --progress --exclude-from $EXCLUDE_LIST $SOURCE_DIR -e ssh "$REMOTE_DIR":"~"

  echo "Transfer Music..."
  rsync -av --delete --progress --exclude-from $EXCLUDE_LIST \
  "/Volumes/Media/iTunes Media/Music" \
  -e ssh "$REMOTE_DIR":"~/Music/iTunes/iTunes\ Media/"

  echo "Transfer Library..."
  rsync -av --delete --progress --exclude-from $EXCLUDE_LIST \
  "/Volumes/Media/iTunes Library.itl" \
  "$REMOTE_DIR":"~/Music/iTunes/"
fi
