#!/usr/local/bin/zsh

# variables
EXCLUDES='.DS_STORE'

# run backup task
read -p "Ready to transfer iTunes files now? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  echo "Transfer Music..."
  rsync -av --delete --exclude $EXCLUDES \
  "/Volumes/Media/iTunes Media/Music" \
  max@HerrDirektor.local:"~/Music/iTunes/iTunes\ Media/"

  echo "Transfer Album Art..."
  rsync -av --delete --exclude $EXCLUDES \
  "/Volumes/Media/Album Artwork" \
  max@HerrDirektor.local:"~/Music/iTunes/"

  echo "Transfer Library..."
  rsync -av --delete --exclude $EXCLUDES \
  "/Volumes/Media/iTunes Library.itl" \
  max@HerrDirektor.local:"~/Music/iTunes/"
fi