#!/bin/bash

set -e

source "../scripts/utils.sh"

readonly HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"

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
