#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

HOMEBREW_FISH="$(brew --prefix)/bin/fish"
readonly HOMEBREW_FISH

if [ "$SHELL" != "$HOMEBREW_FISH" ]; then
  info "SET HOMEBREW'S FISH AS DEFAULT SHELL…"

  if ! grep "$HOMEBREW_FISH" /etc/shells > /dev/null 2>&1 ; then
    sudo sh -c "echo $HOMEBREW_FISH >> /etc/shells" 2>&1
  fi
  sudo chsh -s "$HOMEBREW_FISH" "$USER" 2>&1
fi

# Plugins

/usr/bin/env fish ./plugins.fish
