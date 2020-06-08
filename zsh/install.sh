#!/bin/bash

set -e

source "../scripts/utils.sh"

readonly HOMEBREW_ZSH="/usr/local/bin/zsh"

set_shell() {
  if ! grep "$HOMEBREW_ZSH" /etc/shells > /dev/null 2>&1 ; then
    sudo sh -c "echo $HOMEBREW_ZSH >> /etc/shells" 2>&1 | print_progress
  fi
  sudo chsh -s "$HOMEBREW_ZSH" "$USER" 2>&1 | print_progress
}

if [ "$SHELL" != "$HOMEBREW_ZSH" ]; then
  print_info "SET HOMEBEW ZSH AS DEFAULT SHELL…"
  set_shell
fi
