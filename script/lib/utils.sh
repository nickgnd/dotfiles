#!/usr/bin/env bash

# Utilities used in other scripts

function info() {
  local message=$1
  echo -e "[\033[0;34mINFO\033[0m] $message" >&2
}

function warn() {
  local message=$1
  echo -e "[\033[0;33mWARN\033[0m] $message" >&2
}

function success() {
  local message=$1
  echo -e "[ \033[0;32mOK\033[0m ] $message" >&2
}

function ask() {
  local message=$1
  echo -e "[ \033[0;33m??\033[0m ] $message" >&2
  echo -en "[ \033[0;33m!!\033[0m ] " >&2
}

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

function is_symlink() {
  local dest=$1
  # NOTE: checks if dest is a file, directory or symlink
  [ -f "$dest" ]  || [ -d "$dest" ] || [ -L "$dest" ]
}

function symlink () {
  local src=$1 dest=$2
  local action

  info "LINK '$src' to '$dest'…"
  if is_symlink "$dest"; then
    if [ "$(readlink "$dest")" == "$src" ]; then
      info "LINK '$dest' ALREADY EXISTS…"
      return 0
    else
      ask "File already exists: $dest ($(basename "$src")) [s]kip/[o]override"
      read -r -e -n 1 action </dev/tty
      case "$action" in
        o )
          warn "REMOVE '$dest'…"
          rm -rf "$dest"
          ln -s "$src" "$dest"
          success "LINKED $src TO $dest"
          ;;
        s )
          success "SKIP SYMLINK $src"
          ;;
        * )
          ;;
      esac
    fi
  else
    ln -s "$src" "$dest"
    success "LINKED $src TO $dest"
  fi
}
