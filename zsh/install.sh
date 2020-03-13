#!/bin/bash

set -e

source "../scripts/utils.sh"

readonly OH_MY_ZSH_URL="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
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

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  print_info "INSTALL OH-MY-ZSH…"
  sh -c "$(curl -fsSL $OH_MY_ZSH_URL)"
else
  print_info "UPGRADE OH-MY-ZSH…"
  $SHELL -i -c upgrade_oh_my_zsh | print_progress
fi
