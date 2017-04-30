#!/bin/bash
readonly EXCLUDE_LIST=~/dotfiles/scripts/rsync-excludes.txt
readonly SOURCE_DIRS=(~/Code
                      ~/Dropbox)
readonly BACKUP_DRIVE="/Volumes/archive"
readonly BACKUP_VOLUME="/Volumes/archive/backup/$(hostname -s)/daily/$(date +'%A')"
readonly TODAY="$(date +'%F')"
readonly LAST_RUN_FILE=~/dotfiles/scripts/.last_backup.txt

backup_ran() {
  [ -e $LAST_RUN_FILE ] &&
    grep -Fxq $TODAY $LAST_RUN_FILE
}

menu_bar() {
  local color=$1
  echo -n "$color" | nc -4u -w0 localhost 1738
}

set_status() {
  local last_status=$?
  [ "$last_status" -eq "0" ] &&
  menu_bar green ||
  menu_bar red
}

local_backup() {
  drive_connected $BACKUP_DRIVE &&
  sync_files &&
  write_log
}

sync_files() {
  menu_bar orange
  for dir in "${SOURCE_DIRS[@]}"; do
    rsync -av --delete --exclude-from \
      $EXCLUDE_LIST "$dir" $BACKUP_VOLUME
  done
}

write_log() {
  # TODO: also write log file on server
  echo $TODAY > $LAST_RUN_FILE
}

drive_connected() {
  local dir=$1
  [ -d $dir ]
}

main() {
  backup_ran || local_backup
  set_status
}
main
