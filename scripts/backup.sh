#!/bin/bash
readonly EXCLUDE_LIST=~/dotfiles/scripts/rsync-excludes.txt
readonly NAS="monster.local"
readonly BACKUP_VOLUME="/volume1/NetBackup/$(hostname -s)/daily/$(date +'%A')"
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

remote_backup() {
  nas_available &&
  sync_files &&
  write_log
}

sync_files() {
  menu_bar orange
  rsync -aHXxv --numeric-ids --delete --exclude-from \
    $EXCLUDE_LIST \
    $HOME max@$NAS:$BACKUP_VOLUME
}

write_log() {
  echo $TODAY | ssh max@$NAS "cat > $BACKUP_VOLUME/last_run.txt"
  echo $TODAY > $LAST_RUN_FILE
}

nas_available() {
  nc -z $NAS 22 > /dev/null
}

main() {
  backup_ran || remote_backup
  set_status
}
main
