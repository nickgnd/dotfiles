#!/bin/bash
source "${BASH_SOURCE%/*}/backup.conf"
readonly EXCLUDE_LIST=~/dotfiles/scripts/rsync-excludes.txt
readonly SOURCE_DIRS=(~/Code
                      ~/Nextcloud)
readonly NAS=$NAS_ADDRESS
readonly BACKUP_VOLUME="$NET_BACKUP/$(hostname -s)/daily/$(date +'%A')"
readonly TODAY="$(date +'%F')"
readonly LAST_RUN_FILE=~/dotfiles/scripts/.last_backup.txt
readonly CIPHERS=chacha20-poly1305@openssh.com,aes128-gcm@openssh.com

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

# rsync options explained:
# a -> archive mode (sets some convenient flags)
# E -> preserve executabiliy
# X -> preserve extended attributes
# q -> quite mode (since running in background anyways)
#
# ssh options explained:
# T                -> no pseudo tty (less CPU load on destination)
# o Compression=no -> no compression (faster)
# c <ciphers>      -> use a weaker, but faster openssl cipher
sync_files() {
  menu_bar orange
  for dir in "${SOURCE_DIRS[@]}"; do
    rsync --archive --verbose --xattrs --executability --delete --exclude-from $EXCLUDE_LIST \
      -e "ssh -T -c $CIPHERS -o Compression=no -x"\
      "$dir" max@"$NAS":"$BACKUP_VOLUME"
  done
}

write_log() {
  echo "$TODAY" | ssh max@$NAS "cat > $BACKUP_VOLUME/last_run.txt"
  echo "$TODAY" > "$LAST_RUN_FILE"
}

nas_available() {
  nc -z "$NAS" 22 > /dev/null
}

main() {
  backup_ran || remote_backup
  set_status
}
export PATH="/usr/local/bin:$PATH"
main
