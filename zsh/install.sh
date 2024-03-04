#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

if [ "$(uname -m)" = "arm64" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

HOMEBREW_ZSH="$(brew --prefix)/bin/zsh"
readonly HOMEBREW_ZSH

if [ "$SHELL" != "$HOMEBREW_ZSH" ]; then
  info "SET HOMEBREW'S ZSH AS DEFAULT SHELL…"

  if ! grep "$HOMEBREW_ZSH" /etc/shells > /dev/null 2>&1 ; then
    sudo sh -c "echo $HOMEBREW_ZSH >> /etc/shells" 2>&1
  fi

  # Skip this step since I moved to Fish 🐠
  # sudo chsh -s "$HOMEBREW_ZSH" "$USER" 2>&1
fi
