#!/bin/bash
source "${BASH_SOURCE%/*}/backup.conf"
readonly EXCLUDE_LIST=~/dotfiles/scripts/rsync-excludes.txt
readonly SOURCE_DIRS=(~/Code
                      ~/Dropbox)
readonly NAS=$NAS_ADDRESS
readonly BACKUP_VOLUME="$NET_BACKUP/$(hostname -s)/daily/$(date +'%A')"
readonly TODAY="$(date +'%F')"
readonly LAST_RUN_FILE=~/dotfiles/scripts/.last_backup.txt

backup_ran() {
  [ -e $LAST_RUN_FILE ] &&
    grep -Fxq "$TODAY" "$LAST_RUN_FILE"
}

menu_bar() {
  local color=$1
  echo -n "$color" | nc -4u -w0 localhost 1738
}

set_status() {
  local last_status=$?
  if [ "$last_status" -eq "0" ]
  then
    menu_bar green
  else
    menu_bar red
  fi
}

remote_backup() {
  nas_available &&
  sync_files &&
  write_log
}

sync_files() {
  menu_bar orange
  for dir in "${SOURCE_DIRS[@]}"; do
    rsync -atvz --delete --exclude-from \
      $EXCLUDE_LIST \
      -e "ssh -T -c aes128-gcm@openssh.com -o compression=no -x"\
      "$dir" max@"$NAS":"$BACKUP_VOLUME"
  done
}

write_log() {
  echo "$TODAY" | ssh max@$NAS "cat > $BACKUP_VOLUME/last_run.txt"
  echo "$TODAY" > "$LAST_RUN_FILE"
}

nas_available() {
  nc -z $NAS 22 > /dev/null
}

main() {
  backup_ran || remote_backup
  set_status
}
main
