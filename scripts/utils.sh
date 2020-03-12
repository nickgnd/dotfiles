#!/bin/bash

set -e

print_success() {
  local msg=$1
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$msg"
}

print_info() {
  local msg=$1
  printf "\r  [\033[00;34mINFO\033[0m] %s\n" "$msg"
}

print_question() {
  local msg=$1
  printf "\r  [ \033[0;33m??\033[0m ] -> %s\n" "$msg"
}

print_progress() {
  local data
  while read -r data; do
    printf "\r  [ \033[00;34m..\033[0m ] %s\n" "${data}"
  done
}

symlink_present() {
  local dest=$1
  # NOTE: checks if dest is a file, directory or symlink
  [ -f "$dest" ]  || [ -d "$dest" ] || [ -L "$dest" ]
}

symlink () {
  local src=$1 dest=$2
  local overwrite=false backup=false skip=false
  local action

  if symlink_present "$dest"; then
    if [ "$OVERWRITE_SYMLINKS" == "false" ] && [ "$BACKUP_SYMLINKS" == "false" ] && [ "$SKIP_SYMLINKS" == "false" ]; then

      if [ "$(readlink "$dest")" == "$src" ]; then
        print_info "LINK $src TO $dest ALREADY EXISTS…"
        return 0
      else

        print_question "File already exists: $dest ($(basename "$src")), what do you want to do?"
        print_question "[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"

        printf -v prompt "\r  [ \033[0;33m!!\033[0m ] -> "
        read -rn 1 -e -p "$prompt" action </dev/tty

        case "$action" in
          o ) overwrite=true;;
          O ) overwrite=true OVERWRITE_SYMLINKS=true;;
          b ) backup=true;;
          B ) backup=true BACKUP_SYMLINKS=true;;
          s ) skip=true;;
          S ) skip=true SKIP_SYMLINKS=true;;
          * ) ;;
        esac
      fi
    fi

    if [ "$overwrite" == "true" ]; then
      rm -rf "$dest"
      print_success "REMOVED $dest"
    elif [ "$backup" == "true" ]; then
      mv "$dest" "${dest}.backup"
      print_success "MOVED $dest TO ${dest}.backup"
    elif [ "$skip" == "true" ]; then
      print_success "SKIPPED SYMLINK $src"
    fi
  fi

  if [ "$skip" != "true" ]; then
    ln -s "$src" "$dest"
    print_success "LINKED $src TO $dest"
  fi
}
