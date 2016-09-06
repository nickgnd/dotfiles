#!/bin/bash

# readonly LOG_FILE=~/dotfiles/scripts/log/backup.log
readonly EXCLUDE_LIST=~/dotfiles/scripts/rsync-excludes.txt
# readonly SOURCE_DIRS=(~/Code
#                       ~/Dropbox
#                       /Volumes/Media/iTunes\ Media/Music)

readonly SOURCE_DIRS=(~/Desktop/source)
# readonly BACKUP_DRIVE="/Volumes/archive"
readonly BACKUP_DRIVE=~/Desktop/tryout
# readonly BACKUP_VOLUME="/Volumes/archive/backup/daily/$(date +'%A')"
readonly BACKUP_VOLUME=~/Desktop/goal
readonly LAST_RUN_FILE=~/dotfiles/scripts/.last_backup
# readonly REMOTE=max@HerrDirektor.local

# print_to_log() {
#   local txt=$1
#   echo "$1" >> $LOG_FILE
# }

backup_ran() {
  echo "check for file"
  local date="$(date +'%F')"
  local run_file="$LAST_RUN_FILE"
  [ -e "$run_file" ] && grep -Fxq "$date" $run_file
}

menu_bar() {
  local color=$1
  echo -n "$color" | nc -4u -w0 localhost 1738
}

set_status() {
  local status=$1
  if [ "$status" -eq "0" ]
  then
    menu_bar green
  else
    menu_bar red
  fi
}

local_backup() {
  if drive_connected $BACKUP_DRIVE
  then
    sync_files && write_log
  else
    return 1
  fi
}

sync_files() {
  for dir in "${SOURCE_DIRS[@]}"
  do
    rsync -av --delete --exclude-from $EXCLUDE_LIST "$dir" $BACKUP_VOLUME
  done
}

write_log() {
  local last_run="$(date +'%F')"
  echo "$last_run" > $LAST_RUN_FILE
}

drive_connected() {
  local dir=$1
  [ -d $dir ]
}

main() {
  backup_ran || local_backup
  set_status "$?"
}
main
