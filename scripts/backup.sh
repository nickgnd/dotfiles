#!/bin/bash

readonly LOG_FILE=~/dotfiles/scripts/log/backup.log
readonly EXCLUDE_LIST=~/dotfiles/scripts/rsync-excludes.txt
readonly SOURCE_DIRS=(~/Code
                      ~/Dropbox
                      /Volumes/Media/iTunes\ Media/Music)
readonly BACKUP_DRIVE="/Volumes/archive"
readonly BACKUP_VOLUME="/Volumes/archive/backup/daily/$(date +'%A')"
readonly REMOTE=max@HerrDirektor.local

print_to_log() {
  local txt=$1
  echo "$1" >> $LOG_FILE
}

remote_backup() {
  local dir
  print_to_log "\nTry remote backup $(date +%Y_%m_%d_%H:%M:%S)"
  for dir in "${SOURCE_DIRS[@]}"
  do
    sync_to_remote "$dir"
  done
}

sync_to_remote() {
  local src=$1
  print_to_log "Transfer $src..."
  rsync -av --delete --exclude-from $EXCLUDE_LIST \
    "$src" -e ssh "$REMOTE":"$BACKUP_VOLUME" >> $LOG_FILE
}

local_backup() {
  local dir
  print_to_log "\nLocal backup $(date +%Y_%m_%d_%H:%M:%S)"
  for dir in "${SOURCE_DIRS[@]}"
  do
    sync_local "$dir"
  done
}

sync_local() {
  local src=$1
  print_to_log "Transfer $src..."
  rsync -av --delete --exclude-from $EXCLUDE_LIST \
    "$src" $BACKUP_VOLUME >> $LOG_FILE
}

calculate_log_size() {
  ( wc $LOG_FILE | awk '{ print $1 }' )
}

log_too_big() {
  local size=$1
  local max_size=6000
  [ $size -ge $max_size ]
}

truncate_log() {
  local size=$1
  local min_size=300
  local cut=$(($size-$min_size))

  sed -i '' "1,$cut d" $LOG_FILE
}

drive_connected() {
  local dir=$1
  [ -d $dir ]
}

main() {
  local log_size

  if drive_connected $BACKUP_DRIVE
  then
    local_backup
  else
    remote_backup
  fi

  log_size=$(calculate_log_size)
  log_too_big $log_size \
    && truncate_log $log_size
}
main
