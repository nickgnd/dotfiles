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
      success "LINK '$dest' ALREADY EXISTS…"
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

function create_symlinks() {
  local topic_dir=$1
  local base_destination=${2:-"$HOME/."}
  local files

  files=$(find "$topic_dir" -maxdepth 1 -name "*.symlink")

  for src in $files; do
    name=$(basename "$src" .symlink)
    dest="$base_destination$name"
    symlink "$src" "$dest"
  done
}
