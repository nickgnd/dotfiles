#!/bin/bash

set -e

readonly HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"

print_info() {
  local msg=$1
  printf "\r  [\033[00;34mINFO\033[0m] %s\n" "${msg}"
}

print_progress() {
  local data
  while read -r data; do
    printf "\r  [ \033[00;34m..\033[0m ] %s\n" "${data}"
  done
}

install_or_update_dependencies() {
  brew bundle --no-lock | print_progress
}

if ! command -v brew >/dev/null; then
  print_info "INSTALL HOMEBEW…"
  curl -fsSL "$HOMEBREW_URL" | ruby 2>&1 | print_progress
else
  print_info "UPDATE HOMEBEW…"
  brew update | print_progress
fi

print_info "INSTALL/UPDATE BREWS…"
install_or_update_dependencies
