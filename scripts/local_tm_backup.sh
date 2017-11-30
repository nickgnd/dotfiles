#!/bin/bash
source "${BASH_SOURCE%/*}/backup.conf"
readonly BACKUP_DRIVE=$BACKUP_DRIVE
readonly TODAY="$(date +'%F')"
readonly LAST_RUN_FILE=~/dotfiles/scripts/.last_local_tm_backup.txt
readonly DEST_ID=$LOCAL_TM_DEST

backup_ran() {
  [ -e $LAST_RUN_FILE ] &&
    grep -Fxq "$TODAY" "$LAST_RUN_FILE"
}

tm_backup() {
  drive_available &&
  tmutil startbackup --destination $DEST_ID &&
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
