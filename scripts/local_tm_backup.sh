#!/bin/bash
readonly BACKUP_DRIVE="Volumes/herbert_backup"
readonly TODAY="$(date +'%F')"
readonly LAST_RUN_FILE=~/dotfiles/scripts/.last_local_tm_backup.txt

backup_ran() {
  [ -e $LAST_RUN_FILE ] &&
    grep -Fxq "$TODAY" "$LAST_RUN_FILE"
}

tm_backup() {
  drive_available &&
  tmutil startbackup &&
  write_log
}

write_log() {
  echo "$TODAY" > "$LAST_RUN_FILE"
}

drive_available() {
  [ -d $BACKUP_DRIVE ]
}

main() {
  backup_ran || tm_backup
}
main
