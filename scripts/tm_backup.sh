#!/bin/bash
readonly NAS="monster.local"
readonly TODAY="$(date +'%F')"
readonly LAST_RUN_FILE=~/dotfiles/scripts/.last_tm_backup.txt
readonly DEST_ID="D0570B69-3510-4DE4-919B-59805CB4C95D"

backup_ran() {
  [ -e $LAST_RUN_FILE ] &&
    grep -Fxq "$TODAY" "$LAST_RUN_FILE"
}

tm_backup() {
  nas_available &&
  tmutil startbackup --destination $DEST_ID &&
  write_log
}

write_log() {
  echo "$TODAY" > "$LAST_RUN_FILE"
}

nas_available() {
  nc -z $NAS 22 > /dev/null
}

main() {
  backup_ran || tm_backup
}
main
